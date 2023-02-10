import UIKit

class HomeViewController: UIViewController {
    private let newReleasesTableView = UITableView()
    let viewmodel = HomeViewModel(dataService: SpotifyAPIService())
    var releasesList: [AlbumModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Nuevos Lanzamientos"
        initScreen()
    }
    
    func initScreen(){
        initTableView()
        layout()
        releasesData()
        viewmodel.getReleases()
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            newReleasesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newReleasesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newReleasesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newReleasesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func initTableView() {
        newReleasesTableView.translatesAutoresizingMaskIntoConstraints = false
        newReleasesTableView.dataSource = self
        newReleasesTableView.delegate = self
        newReleasesTableView.register(ReleasesListTableViewCell.self, forCellReuseIdentifier: "ReleasesListTableViewCell" )
        view.addSubview(newReleasesTableView)
        
    }
    
    func releasesData(){
        viewmodel.releasesListDownloaded = { [self] in
            self.releasesList = self.viewmodel.releasesList ?? []
            self.newReleasesTableView.reloadData()
        }
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return releasesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReleasesListTableViewCell", for: indexPath) as! ReleasesListTableViewCell
        let data = self.releasesList[indexPath.row]
        cell.setCellValue(title: data.name, nameArtist: data.name, date: data.releaseDate, image: data.images[0].url)
        
        return cell
    }
    
}

extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewcontreoller = ArtistDetailViewController()
        viewcontreoller.artisID = releasesList[indexPath.row].artists[0].id
        self.navigationController?.pushViewController(viewcontreoller, animated: true)
    }
}
