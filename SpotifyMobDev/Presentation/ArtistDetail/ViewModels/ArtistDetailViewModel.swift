import UIKit

class ArtistDetailViewModel{
    
    private let dataService : SpotifyAPIService?
    var artistInfo: ArtisInfoModel?
    var artistInfoReady: (() -> ())?
    
    init(dataService: SpotifyAPIService){
        self.dataService = dataService
    }
    
    func getArtistInfo(artistID: String){
        dataService?.getArtistInfo(id: artistID, completion: { (response, error) in
            if error == nil{
                self.artistInfo = response
                self.artistInfoReady?()
            }else{
                print(error ?? "error")
            }
        })
    }
}
