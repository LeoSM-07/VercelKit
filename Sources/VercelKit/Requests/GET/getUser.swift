import Foundation

public struct VAuthUserResponse: VercelData {
    public var user: VAuthUser

    enum CodingKeys: CodingKey {
        case user
    }
}

public extension VercelApi {
    /// Retrieve a list of the current User's authentication tokens.
    func getUser() async throws -> VAuthUser? {
        try await getJSONData(
            endpoint: "/v2/user",
            model: VAuthUserResponse.self,
            extraPrint: false
        ).user
    }
}
