import UIKit

class SplashViewController: UIViewController{
    private let imageSplash = UIImageView()
    private var timerSplash = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        imageSplashSetup()
        timerSplashSetup()
    }
    
    func imageSplashSetup(){
        imageSplash.translatesAutoresizingMaskIntoConstraints = false
        imageSplash.image = UIImage(named: "Splash")
        imageSplash.contentMode = .scaleAspectFit
        view.addSubview(imageSplash)
        
        NSLayoutConstraint.activate([
            imageSplash.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
            imageSplash.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageSplash.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func timerSplashSetup(){
        timerSplash = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) {timer in
            let viewController = AuthApiTokenViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
