import Foundation

/// The unique data returned by the ``VercelKit/VercelApi/getAuthTokenList()`` call
public struct VListAuthTokenResponse: VercelData {
    public var tokens: [VAuthToken]
    public var pagination: VPagination

    enum CodingKeys: CodingKey {
        case tokens
        case pagination
    }
}

public extension VercelApi {
    /// Retrieve a list of the current User's authentication tokens.
    func getAuthTokenList() async throws -> VListAuthTokenResponse? {
        try await _getJSONData(
            endpoint: "/v5/user/tokens",
            model: VListAuthTokenResponse.self,
            extraPrint: false
        )
    }
}
