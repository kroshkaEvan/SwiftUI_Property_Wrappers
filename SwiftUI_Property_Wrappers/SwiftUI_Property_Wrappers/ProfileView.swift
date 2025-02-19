//
//  ProfileView.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

struct UserSettings: Codable, Equatable {
    var username: String
    var email: String
}

final class UserSettingsManager: ObservableObject {
    @AppStorage("userSettings")
    private var userSettingsData: Data = Data()
    
    @Published
    var userSettings = UserSettings(username: "Guest", email: "")

    init() { loadUserSettings() }

    func saveUserSettings(_ userSettings: UserSettings) {
        if let encoded = try? JSONEncoder().encode(userSettings) {
            userSettingsData = encoded
            self.userSettings = userSettings
        }
    }

    private func loadUserSettings() {
        if let decoded = try? JSONDecoder().decode(UserSettings.self, from: userSettingsData) {
            userSettings = decoded
        }
    }
}

struct ProfileView: View {
    @StateObject
    private var settingsManager = UserSettingsManager()

    @State
    var userSettings = UserSettings(username: "", email: "")

    var body: some View {
        VStack(spacing: 20) {
            Text("Username: \(settingsManager.userSettings.username)")
            TextField("Name", text: $userSettings.username)
                .textFieldStyle(ProfileTextFieldStyle())
            
            Text("Email: \(settingsManager.userSettings.email)")
            TextField("Email", text: $userSettings.email)
                .textFieldStyle(ProfileTextFieldStyle())
            
            Button("Update Settings") {
                settingsManager.saveUserSettings(userSettings)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal, 50)
        .onAppear {
            userSettings = settingsManager.userSettings
        }
    }
}

struct ProfileTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 20)
            .frame(height: 50)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.cyan.opacity(0.2)))
    }
}

#Preview {
    ProfileView()
}
