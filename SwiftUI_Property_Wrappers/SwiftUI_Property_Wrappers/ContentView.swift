//
//  ContentView.swift
//  SwiftUI_Property_Wrappers
//
//  Created by Evan Tsvetkov on 19.02.25.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("scrollPosition")
    private var scrollPosition: Double = 0

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    ForEach(0..<100) { index in
                        Text("Item \(index + 1)")
                            .padding()
                            .id(index)
                    }
                }
                .frame(maxWidth: .infinity)
                .background(GeometryReader { geometry in
                    Color.clear.preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                })
            }
            .onPreferenceChange(ViewOffsetKey.self) { value in
                scrollPosition = value
            }
            .onAppear {
                proxy.scrollTo(scrollPosition, anchor: .top)
            }
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    ContentView()
}
