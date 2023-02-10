import Foundation

struct AlbumModel: Codable {
    let artists: [ArtistModel]
    let id: String
    let images: [Image]
    let name, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case artists
        case id, images, name
        case releaseDate = "release_date"
    }
}

struct Image: Codable {
    let url: String
}
