//
//  ResponsiveLayoutView.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

struct ResponsiveLayoutView: View {
    @ScaledMetric
    private var iconSize: CGFloat = 30

    @State
    private var isExpanded: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: iconSize, height: iconSize)
            
            Text(isExpanded ? "Expanded" : "Collapsed")
                .font(.system(size: iconSize))
            
            Button(action: {
                isExpanded.toggle()
            }) {
                Text(isExpanded ? "Collapse" : "Expand")
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ResponsiveLayoutView()
}
