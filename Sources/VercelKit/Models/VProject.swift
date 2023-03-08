import Foundation

/// > Important: The ``VProject/Link-swift.struct`` struct has important postconditions. See it's individual documentation for more information.
public struct VProject: VercelData, Identifiable {
    public var id: String
    public var accountId: String
    public var analytics: Analytics?
    public var autoExposeSystemEnvs: Bool?
    public var buildCommand: String?
    public var commandForIgnoringBuildStep: String?
    public var connectConfigurationId: String?
    public var createdAt: Int?
    public var devCommand: String?
    public var directoryListing: Bool
    public var installCommand: String?
    public var env: [Env]?
    public var framework: VProjectFramework?
    public var gitForkProtection: Bool?
    public var latestDeployments: [LatestDeployment]?
    public var link: Link?
    public var name: String
    public var nodeVersion: VProjectNodeVersion
    public var outputDirectory: String?
    public var publicSource: Bool?
    public var rootDirectory: String?
    public var serverlessFunctionRegion: String?
    public var skipGitConnectDuringLink: Bool?
    public var sourceFilesOutsideRootDirectory: Bool?
    public var updatedAt: Int?
    public var live: Bool?
    public var hasFloatingAliases: Bool?

    public enum VProjectFramework: String, VercelData, CaseIterable {
        case blitzjs = "blitzjs"
        case nextjs = "nextjs"
        case gatsby = "gatsby"
        case remix = "remix"
        case astro = "astro"
        case hexo = "hexo"
        case eleventy = "eleventy"
        case docusaurus2 = "docusaurus-2"
        case docusaurus = "docusaurus"
        case preact = "preact"
        case solidstart = "solidstart"
        case dojo = "dojo"
        case ember = "ember"
        case vue = "vue"
        case scully = "scully"
        case ionicAngular = "ionic-angular"
        case angular = "angular"
        case polymer = "polymer"
        case svelte = "svelte"
        case sveltekit = "sveltekit"
        case sveltekit1 = "sveltekit-1"
        case ionicReact = "ionic-react"
        case createReactApp = "create-react-app"
        case gridsome = "gridsome"
        case umijs = "umijs"
        case sapper = "sapper"
        case saber = "saber"
        case stencil = "stencil"
        case nuxtjs = "nuxtjs"
        case redwoodjs = "redwoodjs"
        case hugo = "hugo"
        case jekyll = "jekyll"
        case brunch = "brunch"
        case middleman = "middleman"
        case zola = "zola"
        case hydrogen = "hydrogen"
        case vite = "vite"
        case vitepress = "vitepress"
        case vuepress = "vuepress"
        case parcel = "parcel"
        case sanity = "sanity"
    }

    public enum VProjectNodeVersion: String, VercelData, CaseIterable {
        case x18 = "18.x"
        case x16 = "16.x"
        case x14 = "14.x"
        case x12 = "12.x"
        case x10 = "10.x"
    }

    public struct Env: VercelData, Identifiable {
        public var target: [EnvTarget]?
        public var type: EnvType
        public var id: String?
        public var key: String
        public var value: String
        public var configurationId: String?
        public var createdAt: Int?
        public var updatedAt: Int?
        public var createdBy: String?
        public var updatedBy: String?
        public var gitBranch: String?
        public var edgeConfigId: String?
        public var edgeConfigTokenId: String?
        public var decrypted: Bool?

        public enum EnvTarget: String, VercelData, CaseIterable {
            case production = "production"
            case preview = "preview"
            case development = "development"
        }

        public enum EnvType: String, VercelData, CaseIterable {
            case secret = "secret"
            case system = "system"
            case encrypted = "encrypted"
            case plain = "plain"
            case sensitive = "sensitive"
        }

        public enum CodingKeys: String, CodingKey {
            case target, type, id, key, value, configurationId, createdAt, updatedAt, createdBy, updatedBy, gitBranch, edgeConfigId, edgeConfigTokenId, decrypted
        }
    }

    public struct Analytics: VercelData, Identifiable {
        public var id: String
        public var canceledAt: Int?
        public var disabledAt: Int?
        public var enabledAt: Int?
        public var paidAt: Int?

        enum CodingKeys: CodingKey {
            case id, canceledAt, disabledAt, enabledAt, paidAt
        }
    }

    /// > Important: This type can come in several different forms. See the [official Vercel documentation](https://vercel.com/docs/rest-api#endpoints/projects/retrieve-a-list-of-projects) for more details on what types are actually optional.
    public struct Link: VercelData {
        /// Only appears when `type == .github`
        public var org: String?
        /// Only appears when `type == .github`
        public var repo: String?
        /// Only appears when `type == .github`
        public var repoId: Int?
        /// Appears in all types
        public var type: LinkType
        /// Appears in all types
        public var createdAt: Int
        /// Appears in all types
        public var deployHooks: [DeployHook]
        /// Appears in all types
        public var gitCredentialId: String
        /// Appears in all types
        public var updatedAt: Int
        /// Appears in all types
        public var sourceless: Bool
        /// Appears in all types
        public var productionBranch: String
        /// Only appears when `type == .gitlab`
        public var projectId: String?
        /// Only appears when `type == .gitlab`
        public var projectName: String?
        /// Only appears when `type == .gitlab`
        public var projectNameWithNamespace: String?
        /// Only appears when `type == .gitlab`
        public var projectNamespace: String?
        /// Only appears when `type == .gitlab`
        public var projectUrl: String?
        /// Only appears when `type == .bitbucket`
        public var name: String?
        /// Only appears when `type == .bitbucket`
        public var slug: String?
        /// Only appears when `type == .bitbucket`
        public var owner: String?
        /// Only appears when `type == .bitbucket`
        public var uuid: String?
        /// Only appears when `type == .bitbucket`
        public var workspaceUuid: String?

        public struct DeployHook: VercelData {
            public var createdAt: Int
            public var id: String
            public var name: String
            public var ref: String
            public var url: String
        }

        public enum LinkType: String, VercelData, CaseIterable {
            case github = "github"
            case gitlab = "gitlab"
            case bitbucket = "bitbucket"
        }
    }

    public struct LatestDeployment: VercelData {
        public var alias: [String]?
        public var aliasAssigned: Int?
        public var aliasError: AliasError?
        public var builds: [Build]?
        public var createdAt: Int
        public var createdIn: String
        public var creator: Creator
        public var deploymentHostname: String
        public var name: String
        public var forced: Bool?
        public var id: String
        public var meta: [String: String]?
        public var monorepoManager: String?
        public var plan: Plan
        public var `private`: Bool
        public var readyState: ReadyState
        public var requestedAt: Int?
        public var target: String?
        public var teamId: String?
        public var type = "LAMBDAS"
        public var url: String
        public var userId: String
        public var withCache: Bool?
        public var checksConclusion: ChecksConclusion?
        public var checksState: ChecksState?
        public var readyAt: Int
        public var buildingAt: Int
        /** Whether or not preview comments are enabled for the deployment */
        public var previewCommentsEnabled: Bool?

        public struct AliasError: VercelData {
            public var code: String
            public var message: String

            enum CodingKeys: CodingKey {
                case code
                case message
            }
        }

        public struct Build: VercelData {
            public var use: String
            public var src: String?
            public var dest: String?

            enum CodingKeys: CodingKey {
                case use
                case src
                case dest
            }
        }

        public struct Creator: VercelData {
            public var email: String
            public var githubLogin: String?
            public var gitlabLogin: String?
            public var uid: String
            public var username: String
        }

        public enum Plan: String, VercelData, CaseIterable {
            case hobby = "hobby"
            case enterprise = "enterprise"
            case pro = "pro"
            case oss = "oss"
        }

        public enum ReadyState: String, VercelData, CaseIterable {
            case building = "BUILDING"
            case error = "ERROR"
            case initializing = "INITIALIZING"
            case queued = "QUEUED"
            case ready = "READY"
            case canceled = "CANCELED"
        }

        public enum ChecksConclusion: String, VercelData, CaseIterable {
            case succeeded = "succeeded"
            case failed = "failed"
            case skipped = "skipped"
            case canceled = "canceled"
        }

        public enum ChecksState: String, VercelData, CaseIterable {
            case registered = "registered"
            case running = "running"
            case completed = "completed"
        }


    }
}
