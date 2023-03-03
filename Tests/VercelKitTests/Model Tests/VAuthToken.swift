import XCTest
@testable import VercelKit

final class VAuthTokenTest: XCTestCase {

    let testData = """
        {
            "id": "abcdefghijklmnop",
            "name": "Website, Login with GitHub (Firefox on Mac OS X)",
            "type": "token",
            "origin": "github",
            "scopes": [
                {
                    "type": "user",
                    "origin": "github",
                    "createdAt": 1677778916516
                }
            ],
            "activeAt": 1677778695450,
            "createdAt": 1677778695450
        }
    """.data(using: .utf8)!

    func testDecoding() throws {
        let decoder = JSONDecoder()
        let result = try decoder.decode(VAuthToken.self, from: testData)
        XCTAssert(result.id == "abcdefghijklmnop")
        XCTAssert(result.name == "Website, Login with GitHub (Firefox on Mac OS X)")
        XCTAssert(result.type == "token")
        XCTAssert(result.origin == .github)
        XCTAssert(result.scopes?.first?.type == "user")
        XCTAssert(result.scopes?.first?.origin == .github)
        XCTAssert(result.scopes?.first?.createdAt == 1677778916516)
        XCTAssert(result.activeAt == 1677778695450)
        XCTAssert(result.createdAt == 1677778695450)
    }
}
