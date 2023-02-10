import UIKit
import Alamofire

struct SpotifyAPIService{
    
    static let spotifyApiService = SpotifyAPIService()
    private var url = "https://api.spotify.com/v1/browse/new-releases"
    private var urlGenres = "https://api.spotify.com/v1/recommendations/available-genre-seeds"
    private var urlArtis = "https://api.spotify.com/v1/artists/"
    
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
    
    func getGenresList(completion: @escaping (GenresResponse?, Error?) -> ()) {
        let headers = getHeaders()
        AF.request(urlGenres, method: .get, headers: headers).responseDecodable(of: GenresResponse.self) { response in
            if response.error == nil{
                completion(response.value, nil)
            }else{
                completion(nil, response.error)
            }
        }
    }
    
    func getArtistInfo(id: String, completion: @escaping (ArtisInfoModel?, Error?) -> ()){
        let headers = getHeaders()
        AF.request(urlArtis.appending(id), method: .get, headers: headers).responseDecodable(of: ArtisInfoModel.self) { response in
            if response.error == nil{
                completion(response.value, nil)
            }else{
                completion(nil, response.error)
            }
        }
    }
    
    private func getHeaders() -> HTTPHeaders{
        let token = UserDefaults.standard.string(forKey: "myToken") ?? "noToken"
        let headers: HTTPHeaders = ["Authorization" : "Bearer \(token)", "Content-Type" : "application/json"]
        return headers
    }
}
