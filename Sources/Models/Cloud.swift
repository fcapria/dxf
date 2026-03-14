import Foundation
import SwiftData

@Model
final class Cloud {
    @Attribute(.unique) var id: UUID
    var name: String
    var accessKey: String
    var secretKey: String
    var bucket: String
    @Relationship(inverse: \Destination.cloud) var destinations: [Destination]

    init(name: String, accessKey: String = "", secretKey: String = "", bucket: String = "") {
        self.id = UUID()
        self.name = name
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.bucket = bucket
        self.destinations = []
    }
}
