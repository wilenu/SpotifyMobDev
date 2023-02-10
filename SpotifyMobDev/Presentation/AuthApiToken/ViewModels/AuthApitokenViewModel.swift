import UIKit
import WebKit

class AuthApitokenViewModel {
    private let spotifyApiService: SpotifyAPIService?
    
    init(spotifyApiService: SpotifyAPIService){
        self.spotifyApiService = spotifyApiService
    }
    
    func getApiURL() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "accounts.spotify.com"
        components.path = "/authorize"
        
        components.queryItems = ApiCredentials.authParams.map({URLQueryItem(name: $0, value: $1)})
        guard let url = components.url else { return nil }
        
        return URLRequest(url: url)
    }
}

