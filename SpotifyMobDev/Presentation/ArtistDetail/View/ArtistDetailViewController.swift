import UIKit
import Kingfisher

class ArtistDetailViewController: UIViewController {
    private let artistTittle = UILabel()
    private let artistFolowers = UILabel()
    private let descriptionTittle = UILabel()
    private let artistgenres = UILabel()
    private let artistImage = UIImageView()
    var artisID: String = ""
    let viewModel = ArtistDetailViewModel(dataService: SpotifyAPIService())
    var artistInfo: ArtisInfoModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Artista"
        artistInfoSetup()
        initSetup()
        let a = artisID
        print(a)
        viewModel.getArtistInfo(artistID: a)
        
    }
    
    func artistInfoSetup(){
        self.viewModel.artistInfoReady = { [self] in
            self.artistInfo = self.viewModel.artistInfo
            setArtistInfo()
        }
    }
    
    func setArtistInfo(){
        guard let artistData = artistInfo else { return }
        artistTittle.text = artistData.name
        artistFolowers.text = "Seguidores: \((String(describing: artistData.followers.total)))"
        artistgenres.text = artistData.genres.joined(separator: ",")
        artistImage.kf.setImage(with: URL(string: artistData.images[0].url))
    }
    
    func initSetup(){
        artistImageSetup()
        artistTittleSetup()
        artistFolowersSetup()
        descriptionTittleSetup()
        artistgenresSetup()
        layout()
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            artistImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            artistImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            artistImage.widthAnchor.constraint(equalToConstant: 120),
            artistImage.heightAnchor.constraint(equalToConstant: 120),
            artistTittle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            artistTittle.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 16),
            artistTittle.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            artistFolowers.topAnchor.constraint(equalTo: artistTittle.bottomAnchor, constant: 10),
            artistFolowers.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 16 ),
            artistFolowers.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            descriptionTittle.topAnchor.constraint(equalTo: artistImage.bottomAnchor, constant: 30),
            descriptionTittle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTittle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            artistgenres.topAnchor.constraint(equalTo: descriptionTittle.bottomAnchor, constant: 30),
            artistgenres.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            artistgenres.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func artistImageSetup(){
        artistImage.translatesAutoresizingMaskIntoConstraints = false
        artistImage.contentMode = .scaleAspectFill
        artistImage.layer.cornerRadius = 15
        artistImage.clipsToBounds = true
        view.addSubview(artistImage)
    }
    
    func artistTittleSetup(){
        artistTittle.translatesAutoresizingMaskIntoConstraints = false
        artistTittle.font = .boldSystemFont(ofSize: 30)
        artistTittle.numberOfLines = 0
        view.addSubview(artistTittle)
    }
    
    func artistFolowersSetup(){
        artistFolowers.translatesAutoresizingMaskIntoConstraints = false
        artistFolowers.font = .systemFont(ofSize: 18)
        artistFolowers.textColor = .black
        artistFolowers.numberOfLines = 0
        view.addSubview(artistFolowers)
    }
    
    func descriptionTittleSetup(){
        descriptionTittle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTittle.font = .boldSystemFont(ofSize: 30)
        descriptionTittle.textColor = .black
        descriptionTittle.text = "Géneros"
        descriptionTittle.textAlignment = .left
        descriptionTittle.numberOfLines = 0
        view.addSubview(descriptionTittle)
    }
    
    func artistgenresSetup(){
        artistgenres.translatesAutoresizingMaskIntoConstraints = false
        artistgenres.font = .systemFont(ofSize: 20)
        artistgenres.textColor = .black
        artistgenres.numberOfLines = 0
        view.addSubview(artistgenres)
    }
}

