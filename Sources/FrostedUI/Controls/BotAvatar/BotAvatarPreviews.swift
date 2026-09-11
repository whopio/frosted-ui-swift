import SwiftUI

#Preview("Bot shapes") {
    BotAvatarGallery()
}

#Preview("Bot expressions") {
    HStack(spacing: 20) {
        ForEach(BotAvatarExpression.allCases, id: \.self) { expression in
            VStack(spacing: 12) {
                BotAvatar(size: 64, shape: .circle, tint: .orange, expression: expression)
                Text(verbatim: expression.rawValue).font(.caption)
            }
        }
    }
    .padding(32)
}

#Preview("Bot status and controls") {
    BotAvatarPlayground()
}

private struct BotAvatarGallery: View {
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(88)), count: 7), spacing: 24) {
            ForEach(BotAvatarShape.allCases, id: \.self) { shape in
                VStack(spacing: 8) {
                    BotAvatar(size: 64, identity: shape.rawValue, shape: shape, status: .idle)
                    Text(verbatim: shape.rawValue).font(.system(size: 10))
                }
            }
        }
        .padding(32)
    }
}

private struct BotAvatarPlayground: View {
    @State private var shape: BotAvatarShape = .cookie4
    @State private var status: BotAvatarStatus = .idle
    @State private var mouth = true
    @State private var notification = false
    @State private var highContrast = false
    @State private var blink = 0

    var body: some View {
        VStack(spacing: 24) {
            BotAvatar(size: 160, shape: shape, tint: .orange, status: status,
                      mouth: mouth, notification: notification, highContrast: highContrast,
                      followPointer: true, blinkTrigger: blink)
            Picker("Shape", selection: $shape) {
                ForEach(BotAvatarShape.allCases, id: \.self) { shape in
                    Text(verbatim: shape.rawValue).tag(shape)
                }
            }
            Picker("Status", selection: $status) {
                ForEach(BotAvatarStatus.allCases, id: \.self) { status in
                    Text(verbatim: status.rawValue).tag(status)
                }
            }
            Toggle("Mouth", isOn: $mouth)
            Toggle("Notification", isOn: $notification)
            Toggle("High contrast", isOn: $highContrast)
            Button("Blink") { blink += 1 }
        }
        .padding(40)
        .frame(width: 360)
    }
}
