import Foundation
import SwiftData

enum Codec: String, Codable {
    case prores422Proxy = "ProRes 422 Proxy"
    case prores422LT = "ProRes 422 LT"
    case prores422 = "ProRes 422"
    case h264 = "H.264"
    case h265 = "H.265"
}

enum SizeOption: String, Codable {
    case full = "Full"
    case half = "Half"
}

@Model
final class Setting {
    @Attribute(.unique) var id: UUID
    var name: String
    var codec: Codec
    var size: SizeOption
    var watermark: Bool
    var lutPath: String
    var burnInConfig: String
    @Relationship(inverse: \Queue.setting) var queues: [Queue]

    init(
        name: String,
        codec: Codec = .prores422Proxy,
        size: SizeOption = .full,
        watermark: Bool = false,
        lutPath: String = "",
        burnInConfig: String = ""
    ) {
        self.id = UUID()
        self.name = name
        self.codec = codec
        self.size = size
        self.watermark = watermark
        self.lutPath = lutPath
        self.burnInConfig = burnInConfig
        self.queues = []
    }
}
