import UIKit
import Kingfisher

class CategoriesCell: UITableViewCell{
    var imageIcon = UIImageView()
    var genre = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        imageSetup()
        genreSetup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            imageIcon.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            imageIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageIcon.heightAnchor.constraint(equalToConstant: 60),
            imageIcon.widthAnchor.constraint(equalToConstant: 60),
            genre.topAnchor.constraint(equalTo: topAnchor,constant: 30),
            genre.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor,constant: 20),
            genre.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
            
    func imageSetup(){
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.contentMode = .scaleAspectFit
        imageIcon.layer.cornerRadius = 15
        imageIcon.clipsToBounds = true
        addSubview(imageIcon)
    }
            
    func genreSetup(){
        genre.translatesAutoresizingMaskIntoConstraints = false
        genre.font = .boldSystemFont(ofSize: 20)
        genre.textColor = .black
        genre.numberOfLines = 0
        addSubview(genre)
    }
}
