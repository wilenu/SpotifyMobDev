import UIKit
import WebKit


class SplashViewController : UIViewController {
    var viewModel = SplashViewModel(spotifyApiService: SpotifyAPIService())
    var tabBarVC = TabBarController()
    private let iconView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "icon")
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        layout()
        getApiToken()
        
    }
    
    private func layout(){
        view.backgroundColor = .black
        view.addSubview(iconView)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 250),
            iconView.heightAnchor.constraint(equalToConstant: 250)
        ]) }
    
    func goToHomeView(){
        let viewController = TabBarController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func getApiToken(){
        let urlRequest = viewModel.getApiURL()
        let webview = WKWebView()
        webview.load(urlRequest!)
        webview.navigationDelegate = self
        view = webview
    }
    
}

extension SplashViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let urlString = webView.url?.absoluteString else { return }
        print(urlString)
        
        var tokenString = ""
        if urlString.contains("#access_token=") {
            let range = urlString.range(of: "#access_token=")
            guard let index = range?.upperBound else { return }
            
            tokenString = String(urlString[index...])
        }
        
        if !tokenString.isEmpty {
            let range = tokenString.range(of: "&token_type=Bearer")
            guard let index = range?.lowerBound else { return }
            
            tokenString = String(tokenString[..<index])
            UserDefaults.standard.setValue(tokenString, forKey: "myToken")
            goToHomeView()
            webView.removeFromSuperview()
            print("Auth Token \(tokenString)")
        }
    }
}
