import Foundation
import SwiftData

enum DestinationType: String, Codable {
    case local = "Local"
    case network = "Network"
    case cloud = "Cloud"
}

@Model
final class Destination {
    @Attribute(.unique) var id: UUID
    var name: String
    var type: DestinationType
    var locationURL: String
    var cloud: Cloud?
    var network: Network?
    @Relationship(inverse: \Queue.destination) var queues: [Queue]

    init(
        name: String,
        type: DestinationType,
        locationURL: String = "",
        cloud: Cloud? = nil,
        network: Network? = nil
    ) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.locationURL = locationURL
        self.cloud = cloud
        self.network = network
        self.queues = []
    }
}
