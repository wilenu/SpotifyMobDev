

import Foundation

enum ApiCredentials {
    static let apiHost = "api.spotify.com"
    static let authHost = "accounts.spotify.com"
    static let clientId = "5c83f02608d64563a90ef37842e00af4"
    static let clientSecret = "5f90c49261754a15a11ec0c0fd306f59"
    static let redirectUri = "https://www.google.com"
    static let responseType = "token"
    static let scopes = ""
   
    static var authParams = [
        "response_type": responseType,
        "client_id": clientId,
        "redirect_uri": redirectUri,
        "scope": scopes
    ]
}
