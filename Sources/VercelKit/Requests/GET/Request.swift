import Foundation

extension VercelApi {

    
    func getJSONData<D: Decodable>(
        endpoint: String,
        model: D.Type,
        extraPrint: Bool = false
    ) async throws -> D {
        let url = URL(string: "https://vercel.com/api\(endpoint)")!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let response: (data: Data, response: URLResponse) = try await URLSession.shared.data(for: request)
        if extraPrint {
            print(String(data: response.data, encoding: .utf8) ?? "Unknown Data")
        }
        return try JSONDecoder().decode(D.self, from: response.data)
    }
}
