import Foundation
import SwiftData

enum FieldType: String, Codable {
    case file = "File"
    case folder = "Folder"
}

@Model
final class Field {
    @Attribute(.unique) var id: UUID
    var name: String
    var type: FieldType
    var parent: Field?
    @Relationship(inverse: \Field.parent) var children: [Field]
    var location: String
    var creationDate: Date
    var videoRasterSize: String
    var audioTracks: Int
    @Relationship(inverse: \Queue.field) var queues: [Queue]

    init(
        name: String,
        type: FieldType,
        parent: Field? = nil,
        location: String,
        creationDate: Date = .now,
        videoRasterSize: String = "",
        audioTracks: Int = 0
    ) {
        self.id = UUID()
        self.name = name
        self.type = type
        self.parent = parent
        self.children = []
        self.location = location
        self.creationDate = creationDate
        self.videoRasterSize = videoRasterSize
        self.audioTracks = audioTracks
        self.queues = []
    }
}
