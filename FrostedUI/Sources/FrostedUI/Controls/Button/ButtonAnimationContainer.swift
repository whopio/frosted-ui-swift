import SwiftUI

struct ButtonAnimationContainer<Content: View>: View {
    let content: Content
    let configuration: ButtonStyle.Configuration
    let animationDuration: Double
    let fireHaptic: Bool

    @State private var isExpanded = false
    @State private var lastTapTime: Date?

    init(configuration: ButtonStyle.Configuration,
         animationDuration: Double,
         fireHaptic: Bool = true,
         @ViewBuilder content: () -> Content)
    {
        self.configuration = configuration
        self.animationDuration = animationDuration
        self.fireHaptic = fireHaptic
        self.content = content()
    }

    var body: some View {
        content
            .scaleEffect(isExpanded ? 0.98 : 1)
            .animation(.easeInOut(duration: animationDuration), value: isExpanded)
            .onChange(of: configuration.isPressed) { _, isPressed in
                handlePressStateChange(isPressed)
            }
    }

    private func handlePressStateChange(_ isPressed: Bool) {
        if isPressed {
            isExpanded = true
            lastTapTime = Date()
            guard fireHaptic else { return }
            Task {
                try? await Task.sleep(for: .seconds(0.1))
                HapticManager.shared.fireHaptic(.impact(.rigid))
            }
        } else if let lastTap = lastTapTime {
            let timeElapsed = Date().timeIntervalSince(lastTap)
            let remainingTime = max(0, animationDuration - timeElapsed)

            Task {
                try? await Task.sleep(for: .seconds(remainingTime))
                isExpanded = false
            }
        }
    }
}