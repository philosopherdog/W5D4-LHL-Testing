import Foundation

class PersonManager {
  
  func save(person: Data, with defaults: UserDefaults){
    defaults.set(person, forKey: "personKey")
  }
  
}
