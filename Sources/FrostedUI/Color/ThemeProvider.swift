import SwiftUI

public struct ThemeProvider<Content: View>: View {
    @Environment(\.frostedTheme) var theme
    let content: (FrostedTheme) -> Content

    public init(@ViewBuilder content: @escaping (FrostedTheme) -> Content) {
        self.content = content
    }

    public var body: some View {
        content(theme)
    }
}
