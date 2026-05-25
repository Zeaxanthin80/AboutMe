import SwiftUI

struct ContentView: View {
    enum Tab: Hashable { case home, story, favorites, funfacts }
    @State private var selection: Tab = .home

    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tag(Tab.home)
                .tabItem { Label("Home", systemImage: "person") }

            StoryView()
                .tag(Tab.story)
                .tabItem { Label("Story", systemImage: "book") }

            FavoritesView()
                .tag(Tab.favorites)
                .tabItem { Label("Favorites", systemImage: "star") }

            FunFactsView()
                .tag(Tab.funfacts)
                .tabItem { Label("Fun Facts", systemImage: "hand.thumbsup") }
        }
    }
}

#Preview {
    ContentView()
}
