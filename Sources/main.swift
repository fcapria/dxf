import AppKit
import SwiftData

let app = NSApplication.shared

@MainActor
func setup() {
    let delegate = AppDelegate()
    app.delegate = delegate
}

MainActor.assumeIsolated {
    setup()
}
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var modelContainer: ModelContainer!

    func applicationDidFinishLaunching(_ notification: Notification) {
        do {
            let schema = Schema([
                Field.self,
                Cloud.self,
                Network.self,
                Destination.self,
                Setting.self,
                Queue.self,
                OutputFile.self,
            ])
            modelContainer = try ModelContainer(for: schema)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }

        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 1200, height: 700),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "dxf"
        window.center()
        window.makeKeyAndOrderFront(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
