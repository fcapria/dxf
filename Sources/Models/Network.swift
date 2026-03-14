import Foundation
import SwiftData

@Model
final class Network {
    @Attribute(.unique) var id: UUID
    var name: String
    var host: String
    var username: String
    var password: String
    @Relationship(inverse: \Destination.network) var destinations: [Destination]

    init(name: String, host: String = "", username: String = "", password: String = "") {
        self.id = UUID()
        self.name = name
        self.host = host
        self.username = username
        self.password = password
        self.destinations = []
    }
}
