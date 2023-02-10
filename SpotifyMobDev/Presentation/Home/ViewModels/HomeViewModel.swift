import UIKit
import Alamofire

class HomeViewModel {
    
    private var dataService : SpotifyAPIService?
    var releasesListDownloaded : (() -> ())?
    var releasesList : [AlbumModel]?
    
    init(dataService: SpotifyAPIService){
        self.dataService = dataService
    }
    
    func getReleases(){
        self.dataService?.getReleasesList(completion: { (response, error) in
            if error == nil{
                self.releasesList = self.getAlbumsFromResponse(response: response)
                self.releasesListDownloaded?()
            }else{
                
            }
        })
    }
    
    private func getAlbumsFromResponse(response : ReleasesResponse?) -> [AlbumModel]{
        let albumList = response?.albums.items ?? []
        return albumList
    }
}
