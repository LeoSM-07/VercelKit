import Foundation

/// The unique data returned by the ``VercelKit/VercelApi/getProjectList()`` call
public struct VProjectListResponse: VercelData {
    public var projects: [VProject]
    public var pagination: VPagination

    enum CodingKeys: CodingKey {
        case projects
        case pagination
    }
}

public extension VercelApi {
    /// Retrieve a list of the user's active projects
    func getProjectList() async throws -> VProjectListResponse? {
        try await _getJSONData(
            endpoint: "/v9/projects",
            model: VProjectListResponse.self,
            extraPrint: false
        )
    }
}
