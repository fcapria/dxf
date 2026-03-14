import Foundation
import SwiftData

enum OutputFileStatus: String, Codable {
    case success = "Success"
    case error = "Error"
}

@Model
final class OutputFile {
    @Attribute(.unique) var id: UUID
    var queue: Queue?
    var location: String
    var status: OutputFileStatus
    var errorMessage: String
    var createdAt: Date

    init(
        queue: Queue? = nil,
        location: String = "",
        status: OutputFileStatus = .success,
        errorMessage: String = ""
    ) {
        self.id = UUID()
        self.queue = queue
        self.location = location
        self.status = status
        self.errorMessage = errorMessage
        self.createdAt = .now
    }
}
