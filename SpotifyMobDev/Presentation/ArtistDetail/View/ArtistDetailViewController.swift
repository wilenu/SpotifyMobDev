import UIKit
import Kingfisher

class ArtistDetailViewController: UIViewController {
    private let artistTitle = UILabel()
    private let artistFolowers = UILabel()
    private let descriptionTitle = UILabel()
    private let artistgenres = UILabel()
    private let artistImage = UIImageView()
    var artisID: String = ""
    private let viewModel = ArtistDetailViewModel(dataService: SpotifyAPIService())
    private var artistInfo: ArtisInfoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Artista"
        getArtistInfo()
        initSetup()
        viewModel.getArtistInfo(artistID: artisID)
    }
    
    private func getArtistInfo(){
        self.viewModel.artistInfoReady = { [self] in
            self.artistInfo = self.viewModel.artistInfo
            setArtistInfo()
        }
    }
    
    private func setArtistInfo(){
        guard let artistData = artistInfo else { return }
        artistTitle.text = artistData.name
        artistFolowers.text = "Seguidores: \((String(describing: artistData.followers.total)))"
        artistgenres.text = artistData.genres.joined(separator: ", ")
        artistImage.kf.setImage(with: URL(string: artistData.images[0].url))
    }
    
    private func initSetup(){
        artistImageSetup()
        artistTitleSetup()
        artistFolowersSetup()
        descriptionTitleSetup()
        artistgenresSetup()
        layout()
    }
    
    private func layout(){
        NSLayoutConstraint.activate([
            artistImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            artistImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            artistImage.widthAnchor.constraint(equalToConstant: 120),
            artistImage.heightAnchor.constraint(equalToConstant: 120),
            artistTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            artistTitle.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 16),
            artistTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            artistFolowers.topAnchor.constraint(equalTo: artistTitle.bottomAnchor, constant: 10),
            artistFolowers.leadingAnchor.constraint(equalTo: artistImage.trailingAnchor, constant: 16 ),
            artistFolowers.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            descriptionTitle.topAnchor.constraint(equalTo: artistImage.bottomAnchor, constant: 30),
            descriptionTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            artistgenres.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 30),
            artistgenres.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            artistgenres.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func artistImageSetup(){
        artistImage.translatesAutoresizingMaskIntoConstraints = false
        artistImage.contentMode = .scaleAspectFill
        artistImage.layer.cornerRadius = 15
        artistImage.clipsToBounds = true
        view.addSubview(artistImage)
    }
    
    private func artistTitleSetup(){
        artistTitle.translatesAutoresizingMaskIntoConstraints = false
        artistTitle.font = .boldSystemFont(ofSize: 30)
        artistTitle.numberOfLines = 0
        view.addSubview(artistTitle)
    }
    
    private func artistFolowersSetup(){
        artistFolowers.translatesAutoresizingMaskIntoConstraints = false
        artistFolowers.font = .systemFont(ofSize: 18)
        artistFolowers.textColor = .black
        artistFolowers.numberOfLines = 0
        view.addSubview(artistFolowers)
    }
    
    private func descriptionTitleSetup(){
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.font = .boldSystemFont(ofSize: 30)
        descriptionTitle.textColor = .black
        descriptionTitle.text = "Géneros"
        descriptionTitle.textAlignment = .left
        descriptionTitle.numberOfLines = 0
        view.addSubview(descriptionTitle)
    }
    
    private func artistgenresSetup(){
        artistgenres.translatesAutoresizingMaskIntoConstraints = false
        artistgenres.font = .systemFont(ofSize: 20)
        artistgenres.textColor = .black
        artistgenres.numberOfLines = 0
        view.addSubview(artistgenres)
    }
}
