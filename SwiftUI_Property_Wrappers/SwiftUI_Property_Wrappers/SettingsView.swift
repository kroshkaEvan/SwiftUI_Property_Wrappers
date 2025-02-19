//
//  SettingsView.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode")
    private var isDarkMode: Bool = false

    var body: some View {
        Toggle("Dark Mode", isOn: $isDarkMode)
            .padding(.horizontal, 100)
    }
}

#Preview {
    SettingsView()
}
