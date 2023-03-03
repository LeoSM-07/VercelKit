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

    
//    public func getJSONData<T: Decodable>(
//        endpoint: String,
//        model: T.Type,
//        extraPrint: Bool = false,
//        completion:@escaping(Result<T,Error>) -> ()
//    ) {
//        let url = URL(string: "https://vercel.com/api\(endpoint)")!
//
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "GET"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data else {
//                if let error = error { completion(.failure(error)) }
//                return
//            }
//
//            if extraPrint {
//                print(String(decoding: data, as: UTF8.self))
//            }
//
//            do {
//                let serverData = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(serverData))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
}
