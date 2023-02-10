import UIKit

class CategoriesViewController : UIViewController {
    private let tableView = UITableView()
    private let viewModel = CategoriesViewModel(dataService: SpotifyAPIService())
    private let genre = UILabel()
    var genresList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Géneros Musicales"
        tableSetup()
        genresData()
        viewModel.getGenres()
        layout()
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func tableSetup(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: "CategoriesCell")
        view.addSubview(tableView)
    }
    
    func genresData(){
        viewModel.genresListDownloaded = { [self] in
            self.genresList = viewModel.genresList ?? []
            self.tableView.reloadData()
        }
    }
}

extension CategoriesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        cell.imageIcon.image = UIImage(systemName: "play.circle")
        cell.genre.text = self.genresList[indexPath.row]
        return cell
    }
}
