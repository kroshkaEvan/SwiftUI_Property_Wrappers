//
//  ThemeSettingsView.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case light, dark, system
}

struct ThemeSettingsView: View {
    @AppStorage("selectedTheme")
    private var selectedTheme: Theme = .system

    var body: some View {
        Picker("Theme", selection: $selectedTheme) {
            ForEach(Theme.allCases, id: \.self) { theme in
                Text(theme.rawValue.capitalized)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

#Preview {
    ThemeSettingsView()
}
