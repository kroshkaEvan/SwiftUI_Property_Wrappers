//
//  ScaledPaddingView.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

struct ScaledPaddingView: View {
    @ScaledMetric
    private var padding: CGFloat = 16

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding(padding)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
        .padding()
    }
}

#Preview {
    ScaledPaddingView()
}
