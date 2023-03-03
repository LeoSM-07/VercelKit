import Foundation

/** Authentication token metadata. */
public struct VAuthToken: VercelData, Identifiable {
    public var id: String
    /** The human-readable name of the token. */
    public var name: String
    /** The type of the token. */
    public var type: String
    /** The origin of how the token was created. */
    public var origin: VOrigin?
    /** The access scopes granted to the token. */
    public var scopes: [VAuthTokenScopes]?
    /** Timestamp (in milliseconds) of when the token expires. */
    public var expiresAt: Int?
    /** Timestamp (in milliseconds) of when the token was most recently used. */
    public var activeAt: Int
    /** Timestamp (in milliseconds) of when the token was created. */
    public var createdAt: Int
    /** The struct representing authentication scope data. */
    public struct VAuthTokenScopes: Codable, Sendable {
        public var type: String
        public var teamId: String?
        public var origin: VOrigin
        public var createdAt: Int
        public var expiresAt: Int?

        enum CodingKeys: CodingKey {
            case type
            case teamId
            case origin
            case createdAt
            case expiresAt
        }

        public init(type: String, teamId: String?, origin: VOrigin, createdAt: Int, expiresAt: Int? = nil) {
            self.type = type
            self.teamId = teamId
            self.origin = origin
            self.createdAt = createdAt
            self.expiresAt = expiresAt
        }

        public init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<VAuthToken.VAuthTokenScopes.CodingKeys> = try decoder.container(keyedBy: VAuthToken.VAuthTokenScopes.CodingKeys.self)
            self.type = try container.decode(String.self, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.type)
            self.teamId = try container.decodeIfPresent(String.self, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.teamId)
            self.origin = try container.decode(VOrigin.self, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.origin)
            self.createdAt = try container.decode(Int.self, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.createdAt)
            self.expiresAt = try container.decodeIfPresent(Int.self, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.expiresAt)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: VAuthToken.VAuthTokenScopes.CodingKeys.self)
            try container.encode(self.type, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.type)
            try container.encodeIfPresent(self.teamId, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.teamId)
            try container.encode(self.origin, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.origin)
            try container.encode(self.createdAt, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.createdAt)
            try container.encodeIfPresent(self.expiresAt, forKey: VAuthToken.VAuthTokenScopes.CodingKeys.expiresAt)
        }
    }

    enum CodingKeys: CodingKey {
        case id
        case name
        case type
        case origin
        case scopes
        case expiresAt
        case activeAt
        case createdAt
    }

    public init(id: String, name: String, type: String, origin: VOrigin? = nil, scopes: [VAuthTokenScopes]? = nil, expiresAt: Int?, activeAt: Int, createdAt: Int) {
        self.id = id
        self.name = name
        self.type = type
        self.origin = origin
        self.scopes = scopes
        self.expiresAt = expiresAt
        self.activeAt = activeAt
        self.createdAt = createdAt
    }
}

