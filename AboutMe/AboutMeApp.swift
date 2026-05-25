//
//  AboutMeApp.swift
//  AboutMe
//
//  Created by user on 5/24/26.
//

/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI
import UIKit

@main
struct AboutMeApp: App {
    init() {
        // Ensure UIKit containers don't paint an opaque white background over SwiftUI.
        UIView.appearance().backgroundColor = .clear
        UITabBar.appearance().backgroundColor = .clear
        UITabBar.appearance().isTranslucent = true
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
#Preview {
    ContentView()
}

