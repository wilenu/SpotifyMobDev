import UIKit
import Kingfisher

class ReleasesListTableViewCell: UITableViewCell{
    private let albumTitle = UILabel()
    private let artistName = UILabel()
    private let releaseDate = UILabel()
    private let albumImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        customCellConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCellConfigure(){
        albumImageCell()
        albumTitleCell()
        artistNameCell()
        releaseDateCell()
        layout()
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            albumImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            albumImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            albumImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            albumImage.widthAnchor.constraint(equalToConstant: 120),
            albumImage.heightAnchor.constraint(equalToConstant: 120),
            albumTitle.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            albumTitle.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 12),
            albumTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            artistName.topAnchor.constraint(equalTo: albumTitle.bottomAnchor, constant: 4),
            artistName.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 12),
            artistName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            releaseDate.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 15),
            releaseDate.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 12)
        ])
    }
    
    private func albumImageCell(){
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumImage.contentMode = .scaleAspectFill
        albumImage.layer.cornerRadius = 15
        albumImage.clipsToBounds = true
        addSubview(albumImage)
    }
    
    private func albumTitleCell(){
        albumTitle.translatesAutoresizingMaskIntoConstraints = false
        albumTitle.font = .boldSystemFont(ofSize: 20)
        albumTitle.textColor = .black
        albumTitle.numberOfLines = 0
        addSubview(albumTitle)
    }
    
    private func artistNameCell(){
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.font = .systemFont(ofSize: 16)
        artistName.textColor = .black
        addSubview(artistName)
    }
    
    private func releaseDateCell(){
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.font = .systemFont(ofSize: 16)
        releaseDate.textColor = .black
        addSubview(releaseDate)
    }
    
    func setCellValue(title: String, nameArtist: String, date: String,image: String){
        self.albumTitle.text = title
        self.artistName.text = "Artista: \(nameArtist)"
        self.releaseDate.text = "Lanzamiento: \(date)"
        self.albumImage.kf.setImage(with: URL(string: image))
    }
}
