import Foundation

public struct VProjectListResponse: VercelData {
    public var projects: [VProject]
    public var pagination: VPagination

    enum CodingKeys: CodingKey {
        case projects
        case pagination
    }
}

public extension VercelApi {
    /// Retrieve a list of the current User's authentication tokens.
    func getProjectList() async throws -> VProjectListResponse? {
        try await getJSONData(
            endpoint: "/v9/projects",
            model: VProjectListResponse.self,
            extraPrint: false
        )
    }
}
