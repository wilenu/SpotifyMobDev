import Foundation

class CategoriesViewModel{
    private var dataService : SpotifyAPIService?
    var genresListDownloaded : (() -> ())?
    var genresList: [String]?
    
    init(dataService: SpotifyAPIService){
        self.dataService = dataService
    }
    
    func getGenres(){
        self.dataService?.getGenresList(completion: { (response, error) in
            if error == nil{
                self.genresList = response?.genres
                self.genresListDownloaded?()
            }else{
                print(error ?? "error")
            }
        })
    }
}
