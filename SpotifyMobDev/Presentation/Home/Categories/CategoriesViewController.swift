import UIKit

class CategoriesViewController : UIViewController {
    private let tableView = UITableView()
    private let genre = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Categorías"
        tableSetup()
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
    
}

extension CategoriesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
        //cell.textLabel?.text = "assdasdasd"
        cell.imageIcon.image = UIImage(systemName: "play.circle")
        cell.genre.text = "Album"
        return cell
    }
}

