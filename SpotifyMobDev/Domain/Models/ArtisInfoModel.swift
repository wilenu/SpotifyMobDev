import Foundation

struct ArtisInfoModel: Codable {
    let id, name: String
    let followers: Followers
    let genres: [String]
    let images: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id, name, followers, images, genres
    }
}

// MARK: - Followers
struct Followers: Codable {
    let total: Int
}
