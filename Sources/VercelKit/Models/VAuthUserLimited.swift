import Foundation

/** A limited form of data for the currently authenticated User, due to the authentication token missing privileges to read the full User data. */
public struct VAuthUserLimited: VercelData, Identifiable {
    /** Property indicating that this User data contains only limited information, due to the authentication token missing privileges to read the full User data. Re-login with email, GitHub, GitLab or Bitbucket in order to upgrade the authentication token with the necessary privileges. */
    public var limited: Bool
    /** The User's unique identifier. */
    public var id: String
    /** Email address associated with the User account. */
    public var email: String
    /** Name associated with the User account, or `null` if none has been provided. */
    public var name: String?
    /** Unique username associated with the User account. */
    public var username: String?
    /** SHA1 hash of the avatar for the User account. Can be used in conjunction with the ... endpoint to retrieve the avatar image. */
    public var avatar: String?

    enum CodingKeys: CodingKey {
        case limited
        case id
        case email
        case name
        case username
        case avatar
    }

    public init(limited: Bool, id: String, email: String, name: String? = nil, username: String? = nil, avatar: String? = nil) {
        self.limited = limited
        self.id = id
        self.email = email
        self.name = name
        self.username = username
        self.avatar = avatar
    }
}
