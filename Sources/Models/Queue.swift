import Foundation
import SwiftData

enum QueueStatus: String, Codable {
    case pending = "Pending"
    case encoding = "Encoding"
    case done = "Done"
    case error = "Error"
}

@Model
final class Queue {
    @Attribute(.unique) var id: UUID
    var field: Field?
    var destination: Destination?
    var setting: Setting?
    var status: QueueStatus
    var createdAt: Date
    var startedAt: Date?
    var completedAt: Date?
    @Relationship(inverse: \OutputFile.queue) var outputFiles: [OutputFile]

    init(
        field: Field? = nil,
        destination: Destination? = nil,
        setting: Setting? = nil,
        status: QueueStatus = .pending
    ) {
        self.id = UUID()
        self.field = field
        self.destination = destination
        self.setting = setting
        self.status = status
        self.createdAt = .now
        self.outputFiles = []
    }
}
