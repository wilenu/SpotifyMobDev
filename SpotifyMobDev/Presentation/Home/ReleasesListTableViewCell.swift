import UIKit
import Kingfisher

class ReleasesListTableViewCell: UITableViewCell{
    var albumTitle = UILabel()
    var artistName = UILabel()
    let releaseDate = UILabel()
    let albumImage = UIImageView()
    
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
        albumTittleCell()
        artistNameCell()
        releaseDateCell()
        ReleasesCellConstraints()
        
    }
    
    private func ReleasesCellConstraints(){
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
            releaseDate.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 25),
            releaseDate.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 12)
        ])
    }
    
    private func albumImageCell(){
        albumImage.contentMode = .scaleAspectFill
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        albumImage.layer.cornerRadius = 15
        albumImage.clipsToBounds = true
        addSubview(albumImage)
    }
    
    private func albumTittleCell(){
        albumTitle.font = .boldSystemFont(ofSize: 20)
        albumTitle.textColor = .black
        albumTitle.translatesAutoresizingMaskIntoConstraints = false
        albumTitle.numberOfLines = 0
        addSubview(albumTitle)
    }
    
    private func artistNameCell(){
        artistName.font = .systemFont(ofSize: 16)
        artistName.textColor = .black
        artistName.translatesAutoresizingMaskIntoConstraints = false
        addSubview(artistName)
    }
    
    private func releaseDateCell(){
        releaseDate.font = .systemFont(ofSize: 16)
        releaseDate.textColor = .black
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        addSubview(releaseDate)
    }
    
    func setCellValue(title: String, nameArtist: String, date: String,image: String){
        self.albumTitle.text = title
        self.artistName.text = nameArtist
        self.releaseDate.text = date
        self.albumImage.kf.setImage(with: URL(string: image))
        
    }
    
}

