//
//  ContentView.swift
//  AboutMe
//
//  Created by user on 5/24/26.
//

/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI
import UIKit

struct ContentView: View {
    enum Tab: Hashable { case home, story, favorites, funfacts }
    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Label("Home", systemImage: "person")
                }

            StoryView()
                .tag(Tab.story)
                .tabItem {
                    Label("Story", systemImage: "book")
                }

            FavoritesView()
                .tag(Tab.favorites)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }

            FunFactsView()
                .tag(Tab.funfacts)
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
        .background(
            ZStack {
                HostingViewBackgroundClearer()
                AnimatedBackground(selection: selection)
                    .ignoresSafeArea()
            }
        )
    }
}

struct HostingViewBackgroundClearer: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        uiViewController.view.backgroundColor = .clear
    }
}

struct AnimatedBackground: View {
    let selection: ContentView.Tab

    private var targetColors: [Color] {
        switch selection {
        case .home:
            return [
                Color("LightR"),
                Color(red: 0.42, green: 0.32, blue: 0.27),
                Color("DarkR")
            ]
        case .story:
            return [
                Color("LightR"),
                Color(red: 0.42, green: 0.32, blue: 0.27),
                Color("DarkR")
            ]
        case .favorites, .funfacts:
            return [
                Color(red: 0.11, green: 0.16, blue: 0.24),
                Color(red: 0.22, green: 0.30, blue: 0.42),
                Color(red: 0.42, green: 0.32, blue: 0.27)
            ]
        }
    }

    private var topTarget: (offset: CGSize, blur: CGFloat, opacity: Double, scale: CGFloat) {
        switch selection {
        case .home:
            return (CGSize(width: 140, height: -240), 36, 0.12, 1.0)
        case .story:
            return (CGSize(width: 120, height: -220), 32, 0.10, 0.96)
        case .favorites:
            return (CGSize(width: 160, height: -260), 40, 0.14, 1.06)
        case .funfacts:
            return (CGSize(width: 130, height: -230), 34, 0.12, 1.02)
        }
    }

    private var bottomTarget: (offset: CGSize, blur: CGFloat, opacity: Double, scale: CGFloat) {
        switch selection {
        case .home:
            return (CGSize(width: -150, height: 220), 36, 0.12, 1.0)
        case .story:
            return (CGSize(width: -170, height: 200), 32, 0.10, 0.98)
        case .favorites:
            return (CGSize(width: -130, height: 240), 40, 0.15, 1.05)
        case .funfacts:
            return (CGSize(width: -155, height: 210), 34, 0.12, 1.0)
        }
    }

    @State private var currentColors: [Color] = [
        Color("LightR"),
        Color(red: 0.42, green: 0.32, blue: 0.27),
        Color("DarkR")
    ]
    @State private var previousColors: [Color] = [
        Color("LightR"),
        Color(red: 0.42, green: 0.32, blue: 0.27),
        Color("DarkR")
    ]
    @State private var phase: Double = 1.0

    @State private var topOffset: CGSize = CGSize(width: 140, height: -240)
    @State private var bottomOffset: CGSize = CGSize(width: -150, height: 220)
    @State private var topBlur: CGFloat = 36
    @State private var bottomBlur: CGFloat = 36
    @State private var topOpacity: Double = 0.12
    @State private var bottomOpacity: Double = 0.12
    @State private var topScale: CGFloat = 1.0
    @State private var bottomScale: CGFloat = 1.0

    var body: some View {
        ZStack {
            // Crossfading gradients
            LinearGradient(colors: previousColors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(1 - phase)

            LinearGradient(colors: currentColors, startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(phase)

            // Decorative circles shared across tabs (animated)
            Circle()
                .fill(Color.white.opacity(topOpacity))
                .frame(width: 260, height: 260)
                .blur(radius: topBlur)
                .scaleEffect(topScale)
                .offset(x: topOffset.width, y: topOffset.height)

            Circle()
                .fill(Color.black.opacity(bottomOpacity))
                .frame(width: 320, height: 320)
                .blur(radius: bottomBlur)
                .scaleEffect(bottomScale)
                .offset(x: bottomOffset.width, y: bottomOffset.height)
        }
        .onAppear {
            currentColors = targetColors
            previousColors = targetColors
            phase = 1

            let tTop = topTarget
            let tBottom = bottomTarget

            self.topOffset = tTop.offset
            self.topBlur = tTop.blur
            self.topOpacity = tTop.opacity
            self.topScale = tTop.scale

            self.bottomOffset = tBottom.offset
            self.bottomBlur = tBottom.blur
            self.bottomOpacity = tBottom.opacity
            self.bottomScale = tBottom.scale
        }
        .onChange(of: selection) { _, _ in
            previousColors = currentColors
            currentColors = targetColors
            phase = 0
            withAnimation(.easeInOut(duration: 0.6)) {
                phase = 1

                let tTop = topTarget
                let tBottom = bottomTarget

                self.topOffset = tTop.offset
                self.topBlur = tTop.blur
                self.topOpacity = tTop.opacity
                self.topScale = tTop.scale

                self.bottomOffset = tBottom.offset
                self.bottomBlur = tBottom.blur
                self.bottomOpacity = tBottom.opacity
                self.bottomScale = tBottom.scale
            }
        }
    }
}

#Preview {
    ContentView()
}

