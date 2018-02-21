import Foundation

// This Protocol uses the same method signatures of UserDefaults which allows us to override them in the Mock object

protocol UserDefaultsProtocol: class {
  func set(_ value: Any?, forKey defaultName: String)
  func data(forKey: String)-> Data?
}

// UserDefaults is wrapped with our protocol, and it already implements the methods!
extension UserDefaults: UserDefaultsProtocol {}


