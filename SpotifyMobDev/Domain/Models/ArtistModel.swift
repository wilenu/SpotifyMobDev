import Foundation

struct ArtistModel: Codable {
    let href: String
    let id, name: String
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case href, id, name, uri
    }
}
