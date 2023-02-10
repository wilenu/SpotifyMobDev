import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .systemBackground
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupTabBar()
    }
    
    func setupTabBar() {
        let homevc = UINavigationController(rootViewController: HomeViewController())
        let categoryvc = UINavigationController(rootViewController: CategoriesViewController())
        
        homevc.tabBarItem.image = UIImage(systemName: "play.square.stack")
        categoryvc.tabBarItem.image = UIImage(systemName: "text.line.first.and.arrowtriangle.forward")
        
        setViewControllers([homevc,categoryvc], animated: true)
    }
}
