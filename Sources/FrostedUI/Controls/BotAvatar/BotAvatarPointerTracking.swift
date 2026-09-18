import SwiftUI

/// Observes the containing window without intercepting the avatar's hit testing.
/// Tracking is installed only while a visible, animated face requests it.
#if os(macOS)
import AppKit

struct BotAvatarPointerTracking: NSViewRepresentable {
    let enabled: Bool
    let onGaze: (CGPoint?) -> Void

    func makeNSView(context: Context) -> TrackingView { TrackingView() }

    func updateNSView(_ view: TrackingView, context: Context) {
        view.onGaze = onGaze
        view.enabled = enabled
        view.updateTracking()
    }

    static func dismantleNSView(_ view: TrackingView, coordinator: ()) {
        view.stopTracking()
    }

    final class TrackingView: NSView {
        var enabled = false
        var onGaze: ((CGPoint?) -> Void)?
        private weak var trackedView: NSView?
        private var area: NSTrackingArea?
        override var isFlipped: Bool { true }
        override func hitTest(_ point: NSPoint) -> NSView? { nil }

        override func viewDidMoveToWindow() {
            super.viewDidMoveToWindow()
            updateTracking()
        }

        func updateTracking() {
            let target = enabled ? window?.contentView : nil
            guard target !== trackedView else { return }
            stopTracking()
            guard let target else { return }
            let area = NSTrackingArea(rect: .zero,
                                      options: [.mouseMoved, .mouseEnteredAndExited, .activeInActiveApp, .inVisibleRect],
                                      owner: self)
            target.addTrackingArea(area)
            trackedView = target
            self.area = area
        }

        func stopTracking() {
            if let area { trackedView?.removeTrackingArea(area) }
            area = nil
            trackedView = nil
        }

        override func mouseMoved(with event: NSEvent) { track(event) }
        override func mouseEntered(with event: NSEvent) { track(event) }
        override func mouseExited(with event: NSEvent) { onGaze?(nil) }

        private func track(_ event: NSEvent) {
            guard enabled, event.window === window else { return }
            onGaze?(BotAvatarPointerGaze.resolve(location: convert(event.locationInWindow, from: nil), bounds: bounds))
        }
    }
}
#elseif os(iOS)
import UIKit

struct BotAvatarPointerTracking: UIViewRepresentable {
    let enabled: Bool
    let onGaze: (CGPoint?) -> Void

    func makeUIView(context: Context) -> TrackingView { TrackingView() }

    func updateUIView(_ view: TrackingView, context: Context) {
        view.onGaze = onGaze
        view.enabled = enabled
        view.updateTracking()
    }

    static func dismantleUIView(_ view: TrackingView, coordinator: ()) {
        view.stopTracking()
    }

    final class TrackingView: UIView, UIGestureRecognizerDelegate {
        var enabled = false
        var onGaze: ((CGPoint?) -> Void)?
        private weak var trackedWindow: UIWindow?
        private var hover: UIHoverGestureRecognizer?
        override func point(inside point: CGPoint, with event: UIEvent?) -> Bool { false }

        override func didMoveToWindow() {
            super.didMoveToWindow()
            updateTracking()
        }

        func updateTracking() {
            let target = enabled ? window : nil
            guard target !== trackedWindow else { return }
            stopTracking()
            guard let target else { return }
            let hover = UIHoverGestureRecognizer(target: self, action: #selector(track(_:)))
            hover.cancelsTouchesInView = false
            hover.delegate = self
            target.addGestureRecognizer(hover)
            trackedWindow = target
            self.hover = hover
        }

        func stopTracking() {
            if let hover { trackedWindow?.removeGestureRecognizer(hover) }
            hover = nil
            trackedWindow = nil
        }

        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                               shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            true
        }

        @objc private func track(_ recognizer: UIHoverGestureRecognizer) {
            guard enabled else { return }
            switch recognizer.state {
            case .began, .changed:
                onGaze?(BotAvatarPointerGaze.resolve(location: recognizer.location(in: self), bounds: bounds))
            default:
                onGaze?(nil)
            }
        }
    }
}
#endif

enum BotAvatarPointerGaze {
    static func resolve(location: CGPoint, bounds: CGRect) -> CGPoint? {
        guard bounds.width > 0, bounds.height > 0 else { return nil }
        let range = max(bounds.width * 3, 160)
        return CGPoint(x: BotAvatar.clampGaze((location.x - bounds.midX) / range),
                       y: BotAvatar.clampGaze((location.y - bounds.midY) / range))
    }
}
