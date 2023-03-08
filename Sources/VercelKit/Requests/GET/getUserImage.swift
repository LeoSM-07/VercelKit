import UIKit

public extension VercelApi {
    /// Provides a convenience for downloading a `UIImage` from the user's information.
    ///
    ///  > Note: This function uses the following (undocumented) URL. It appears to be the same url that Vercel uses in their own frontend.`https://vercel.com/api/www/avatar/abcdefgh`
    ///
    /// - Parameters:
    ///   - avatarHash: The SHA1 hash of the avatar for the User account. Can be found in the ``VercelKit/VAuthUser/avatar`` property on ``VercelKit/VAuthUser``
    ///   - size: The optional size of the image to be passed to Vercel servers. Lower size results in less data.
    /// - Returns: `UIImage` of the user's avatar
    func getUserImage(_ avatarHash: String, size: Int? = nil) async throws -> UIImage? {
        let url = URL(string: "https://vercel.com/api/www/avatar/\(avatarHash)\(size != nil ? "?s=\(size!)" : "")")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return UIImage(data: data)
    }
}
