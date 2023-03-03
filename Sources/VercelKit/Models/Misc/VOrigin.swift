import Foundation

public enum VOrigin: String, VercelData {
    case saml = "saml"
    case github = "github"
    case gitlab = "gitlab"
    case bitbucket = "bitbucket"
    case email = "email"
    case manual = "manual"
}
