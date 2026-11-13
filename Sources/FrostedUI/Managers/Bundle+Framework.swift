#if !SWIFT_PACKAGE
import Foundation

private final class FrostedBundleToken {}

extension Bundle {
    static let module = Bundle(for: FrostedBundleToken.self)
}
#endif
