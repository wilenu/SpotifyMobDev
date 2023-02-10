import UIKit
import WebKit

class SplashViewController : UIViewController {
    var viewModel = SplashViewModel(spotifyApiService: SpotifyAPIService())
    var tabBarVC = TabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        getApiToken()
    }
    
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
