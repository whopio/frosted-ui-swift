import Foundation

/// Evaluates motion at a given time, preserving the static status pose when disabled.
struct BotAvatarMotion {
    var x: CGFloat = 0
    var y: CGFloat = 0
    var blink: CGFloat = 1
    var scale: CGFloat = 1

    init(time: Double, statusTime: Double, blinkTime: Double?, status: BotAvatarStatus?, enabled: Bool, gazing: Bool) {
        y = status == .thinking ? -0.05 : (status == .blocked ? 0.035 : 0)
        guard enabled else { return }

        let breath = Self.phase(time, duration: 5.6)
        scale = 1 + 0.005 * (1 - cos(breath * 2 * .pi)) / 2
        if status == .done, statusTime >= 0, statusTime < 0.6 {
            scale = Self.sample(statusTime / 0.6, [(0, 1), (0.4, 1.04), (1, 1)])
        }
        if let blinkTime, blinkTime >= 0, blinkTime < 0.34 {
            blink = Self.sample(blinkTime / 0.34, [(0, 1), (0.35, 0.08), (0.55, 0.08), (1, 1)])
        } else {
            blink = Self.sample(Self.phase(time, duration: 5.2), [(0, 1), (0.91, 1), (0.933, 0.08), (0.972, 1), (1, 1)])
        }
        guard !gazing else { return }
        let phase: Double
        switch status {
        case .thinking:
            phase = Self.phase(time, duration: 4.4)
            x = Self.sample(phase, [(0, 0), (0.25, -0.025), (0.6, 0.025), (0.85, 0.01), (1, 0)])
            y += Self.sample(phase, [(0, 0), (0.25, -0.003), (0.6, -0.005), (0.85, 0.002), (1, 0)])
        case .working:
            phase = Self.phase(statusTime, duration: 1.8)
            x = Self.sample(phase, [(0, 0), (0.12, -0.03), (0.42, 0.03), (0.52, -0.03), (0.88, 0.03), (1, 0)])
            y += Self.sample(phase, [(0, 0), (0.12, -0.01), (0.42, -0.01), (0.52, 0.01), (0.88, 0.01), (1, 0)])
        case .waiting:
            phase = Self.phase(time, duration: 5.2)
            x = Self.sample(phase, [(0, 0), (0.12, -0.065), (0.3, -0.065), (0.42, 0.065), (0.6, 0.065), (0.72, 0), (1, 0)])
            y += Self.sample(phase, [(0, 0), (0.12, 0.005), (0.6, 0.005), (0.72, 0), (1, 0)])
        case .blocked: break
        default:
            phase = Self.phase(time, duration: 9)
            x = Self.sample(phase, [(0, 0), (0.18, 0.009), (0.42, -0.008), (0.58, 0.003), (0.8, -0.006), (1, 0)])
            y += Self.sample(phase, [(0, 0), (0.18, -0.006), (0.42, 0.005), (0.58, 0.009), (0.8, -0.005), (1, 0)])
        }
    }

    private static func phase(_ time: Double, duration: Double) -> Double {
        let remainder = time.truncatingRemainder(dividingBy: duration)
        return (remainder < 0 ? remainder + duration : remainder) / duration
    }

    private static func sample(_ phase: Double, _ frames: [(Double, Double)]) -> Double {
        for index in 1..<frames.count where phase <= frames[index].0 {
            let (start, a) = frames[index - 1]
            let (end, b) = frames[index]
            let progress = min(1, max(0, (phase - start) / (end - start)))
            let eased = (1 - cos(progress * .pi)) / 2
            return a + (b - a) * eased
        }
        return frames.last?.1 ?? 0
    }
}
