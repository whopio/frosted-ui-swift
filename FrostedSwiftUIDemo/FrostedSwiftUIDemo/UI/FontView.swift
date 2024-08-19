//
//  FontView.swift
//  FrostedSwiftUIDemo
//
//  Created by Sakun Acharige on 8/19/24.
//

import SwiftUI
import FrostedUI_Swift

struct FontView: View {
    var body: some View {
        ScrollView {
            Group {
                ForEach(FontStep.allCases, id: \.self) { step in
                    ForEach(FontStyle.allCases, id: \.self) { style in
                        FontStyleView(style: style, step: step)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    FontView()
}
