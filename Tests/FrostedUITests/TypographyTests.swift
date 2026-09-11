import SnapshotTesting
import SwiftUI
import XCTest
import FrostedUI

final class TypographyTests: XCTestCase {
    @MainActor
    func testText() throws {
        try snapshot(TypographySnapshotView(), testName: #function)
    }

    @MainActor
    func testTextTrimmed() throws {
        try snapshot(TypographySnapshotView(trim: true), testName: #function)
    }

    @MainActor
    func testHeadings() throws {
        try snapshot(TypographySnapshotView(headings: true), testName: #function)
    }

    @MainActor
    func testHeadingsTrimmed() throws {
        try snapshot(TypographySnapshotView(headings: true, trim: true), testName: #function)
    }

    @MainActor
    private func snapshot(_ view: TypographySnapshotView, testName: String) throws {
        let renderer = ImageRenderer(content: view)
        renderer.scale = 2
        #if os(macOS)
        assertSnapshot(of: try XCTUnwrap(renderer.nsImage), as: .image, named: "macOS", testName: testName)
        #else
        assertSnapshot(of: try XCTUnwrap(renderer.uiImage), as: .image(scale: 2), named: "iOS", testName: testName)
        #endif
    }
}

struct TypographySnapshotView: View {
    var headings = false
    var trim = false

    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 16) {
            GridRow {
                ForEach(FrostedTextWeight.allCases, id: \.self) { weight in
                    Text(verbatim: String(describing: weight))
                        .font(.system(size: 12))
                        .frame(width: 220, height: 24, alignment: .leading)
                }
            }
            if headings {
                ForEach(FrostedHeadingSize.allCases, id: \.self) { size in
                    GridRow(alignment: .firstTextBaseline) {
                        ForEach(FrostedTextWeight.allCases, id: \.self) { weight in
                            Text(verbatim: "Agyp 012\néÅ")
                                .frostedHeading(size: size, weight: weight, rawColor: .black, trim: trim)
                                .frame(width: 220, alignment: .leading)
                                .border(Color.gray.opacity(0.3))
                        }
                    }
                }
            } else {
                ForEach(FrostedTextSize.allCases, id: \.self) { size in
                    GridRow(alignment: .firstTextBaseline) {
                        ForEach(FrostedTextWeight.allCases, id: \.self) { weight in
                            Text(verbatim: "Agyp 012\néÅ")
                                .frostedText(size: size, weight: weight, rawColor: .black, trim: trim)
                                .frame(width: 220, alignment: .leading)
                                .border(Color.gray.opacity(0.3))
                        }
                    }
                }
            }
        }
        .fixedSize()
        .padding(24)
        .foregroundStyle(.black)
        .background(.white)
        .environment(\.colorScheme, .light)
        .environment(\.locale, Locale(identifier: "en_US"))
        .environment(\.layoutDirection, .leftToRight)
        .environment(\.dynamicTypeSize, .large)
    }
}
