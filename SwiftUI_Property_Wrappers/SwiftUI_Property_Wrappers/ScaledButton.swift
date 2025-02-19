//
//  ScaledButton.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

struct ScaledButton: View {
    @ScaledMetric
    private var buttonWidth: CGFloat = 100
    
    @ScaledMetric
    private var buttonHeight: CGFloat = 50

    var body: some View {
        Button(action: {}) {
            Text("Tap Me")
                .frame(width: buttonWidth, height: buttonHeight)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ScaledButton()
}
