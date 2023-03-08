import Foundation

/// The unique data returned by the ``VercelKit/VercelApi/getUser()`` call
public struct VAuthUserResponse: VercelData {
    public var user: VAuthUser

    enum CodingKeys: CodingKey {
        case user
    }
}

public extension VercelApi {
    /// Retrieve the data for the currently authenticated User.
    func getUser() async throws -> VAuthUser? {
        try await _getJSONData(
            endpoint: "/v2/user",
            model: VAuthUserResponse.self,
            extraPrint: false
        ).user
    }
}
