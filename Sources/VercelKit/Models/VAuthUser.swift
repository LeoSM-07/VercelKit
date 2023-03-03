import Foundation

/** Data for the currently authenticated User. */
public struct VAuthUser: VercelData, Identifiable {
    /** UNIX timestamp (in milliseconds) when the User account was created. */
    public var createdAt: Int
    /** When the User account has been "soft blocked", this property will contain the date when the restriction was enacted, and the identifier for why. */
    public var softBlock: Block?
    /** An object containing billing infomation associated with the User account. */
    public var billing: Billing?
    /** An object containing infomation related to the amount of platform resources may be allocated to the User account. */
    public var resourceConfig: ResourceConfig
    /** Prefix that will be used in the URL of "Preview" deployments created by the User account. */
    public var stagingPrefix: String
    /** set of dashboard view preferences (cards or list) per scopeId */
    public var activeDashboardViews: [DashboardView]?
    /** Whether the user has a trial available for a paid plan subscription. */
    public var hasTrialAvailable: Bool
    /** The User's unique identifier. */
    public var id: String
    /** Email address associated with the User account. */
    public var email: String
    /** Name associated with the User account, or `null` if none has been provided. */
    public var name: String?
    /** Unique username associated with the User account. */
    public var username: String
    /** SHA1 hash of the avatar for the User account. Can be used in conjunction with the ... endpoint to retrieve the avatar image. */
    public var avatar: String?

    public struct Billing: VercelData {
        public var plan: String
        public var currency: String
        public var status: String

        enum CodingKeys: CodingKey {
            case plan
            case currency
            case status
        }
    }

    public struct Block: VercelData {
        public var blockedAt: String
        public var reason: BlockReason

        public enum BlockReason: String, VercelData {
            case fairUseLimitsExceeded = "FAIR_USE_LIMITS_EXCEEDED"
            case enterpriseTrialEnded = "ENTERPRISE_TRIAL_ENDED"
            case blockedForPlatformAbuse = "BLOCKED_FOR_PLATFORM_ABUSE"
            case unpaidInvoice = "UNPAID_INVOICE"
            case subscriptionExpired = "SUBSCRIPTION_EXPIRED"
            case subscriptionCanceled = "SUBSCRIPTION_CANCELED"
        }

        enum CodingKeys: CodingKey {
            case blockedAt
            case reason
        }
    }

    public struct ResourceConfig: VercelData {
        public var nodeType: String?
        public var concurrentBuilds: Int?
        public var awsAccountType: String?
        public var awsAccountIds: [String]?
        public var cfZoneName: String?
        /** To overwrite the number of Edge Configs an account can create. */
        public var edgeConfigs: Int?
        /** To overwrite the maximum size of an Edge Config per account. Size is in kilobytes, eg 64 leads to 64kB or 64_000 bytes worth of storage */
        public var edgeConfigSize: Int?

        enum CodingKeys: CodingKey {
            case nodeType
            case concurrentBuilds
            case awsAccountType
            case awsAccountIds
            case cfZoneName
            case edgeConfigs
            case edgeConfigSize
        }
    }

    public struct DashboardView: VercelData {
        public var scopeId: String
        public var viewPreference: DashboardViewPreference

        public enum DashboardViewPreference: String, VercelData {
            case cards = "cards"
            case list = "list"
        }

        enum CodingKeys: CodingKey {
            case scopeId
            case viewPreference
        }
    }

    enum CodingKeys: CodingKey {
        case createdAt
        case softBlock
        case billing
        case resourceConfig
        case stagingPrefix
        case activeDashboardViews
        case hasTrialAvailable
        case id
        case email
        case name
        case username
        case avatar
    }
}
