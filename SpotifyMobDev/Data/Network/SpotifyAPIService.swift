import UIKit
import Alamofire

struct SpotifyAPIService{
    
    static let spotifyApiService = SpotifyAPIService()
    private var url = "https://api.spotify.com/v1/browse/new-releases"
    
    func getReleasesList(completion: @escaping (ReleasesResponse?, Error?) -> ()) {
        let headers = getHeaders()
        AF.request(url, method: .get, headers: headers).responseDecodable(of: ReleasesResponse.self) { response in
            if response.error == nil{
                completion(response.value, nil)
            }else{
                completion(nil, response.error)
            }
        }
    }
    
    func getGenresList(){
        
    }
    
    private func getHeaders() -> HTTPHeaders{
        let token = UserDefaults.standard.string(forKey: "myToken") ?? "noToken"
        let headers: HTTPHeaders = ["Authorization" : "Bearer \(token)", "Content-Type" : "application/json"]
        return headers
    }
}
