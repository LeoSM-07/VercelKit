import Foundation

public struct VProject: VercelData, Identifiable {
    public var id: String
    public var accountId: String
    public var analytics: VProjectAnalytics?
    public var autoExposeSystemEnvs: Bool?
    public var buildCommand: String?
    public var commandForIgnoringBuildStep: String?
    public var connectConfigurationId: String?
    public var createdAt: Int?
    public var devCommand: String?
    public var directoryListing: Bool
    public var installCommand: String?
    public var env: [VProjectEnv]?
    public var framework: VProjectFramework?
    public var gitForkProtection: Bool?
//  public var latestDeployments: ??
//  public var link: ??
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

    public struct VProjectAnalytics: VercelData, Identifiable {
        public var id: String
        public var canceledAt: Int?
        public var disabledAt: Int?
        public var enabledAt: Int?
        public var paidAt: Int?

        enum CodingKeys: CodingKey {
            case id, canceledAt, disabledAt, enabledAt, paidAt
        }
    }

    public struct VProjectEnv: VercelData, Identifiable {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            if let targets = try container.decodeIfPresent([String].self, forKey: .target) {
                self.target = targets.compactMap { EnvTarget(rawValue: $0) }
            } else if let target = try container.decodeIfPresent(String.self, forKey: .target) {
                self.target = [EnvTarget(rawValue: target)].compactMap { $0 }
            } else {
                self.target = nil
            }
            let type = try container.decode(String.self, forKey: .type)
            self.type = EnvType(rawValue: type) ?? .secret
            self.id = try container.decodeIfPresent(String.self, forKey: .id)
            self.key = try container.decode(String.self, forKey: .key)
            self.value = try container.decode(String.self, forKey: .value)
            self.configurationId = try container.decodeIfPresent(String.self, forKey: .configurationId)
            self.createdAt = try container.decodeIfPresent(Int.self, forKey: .createdAt)
            self.updatedAt = try container.decodeIfPresent(Int.self, forKey: .updatedAt)
            self.createdBy = try container.decodeIfPresent(String.self, forKey: .createdBy)
            self.updatedBy = try container.decodeIfPresent(String.self, forKey: .updatedBy)
            self.gitBranch = try container.decodeIfPresent(String.self, forKey: .gitBranch)
            self.edgeConfigId = try container.decodeIfPresent(String.self, forKey: .edgeConfigId)
            self.edgeConfigTokenId = try container.decodeIfPresent(String.self, forKey: .edgeConfigTokenId)
            self.decrypted = try container.decodeIfPresent(Bool.self, forKey: .decrypted)
        }
    }

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

    enum CodingKeys: CodingKey {
        case id, accountId, analytics, autoExposeSystemEnvs, buildCommand, commandForIgnoringBuildStep, connectConfigurationId, createdAt, devCommand, directoryListing, installCommand, env, framework, gitForkProtection, name, nodeVersion, outputDirectory, publicSource, rootDirectory, serverlessFunctionRegion, skipGitConnectDuringLink, sourceFilesOutsideRootDirectory, updatedAt, live, hasFloatingAliases
    }
}
