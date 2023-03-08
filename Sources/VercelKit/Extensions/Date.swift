import Foundation

public extension Date {
    /// Convert an `Int` timestamp to a swift date. Especially useful for the specific timestamps returned by VercelKit.
    /// - Parameter ms: An Integer representing a date in milliseconds since the UNIX epoch.
    init(ms: Int) {
        self = Date(timeIntervalSince1970: TimeInterval(ms) / 1000)
    }
}
