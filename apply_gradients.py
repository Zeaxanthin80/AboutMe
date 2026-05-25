import sys

def process(path, replacement):
    with open(path, 'r') as f:
        t = f.read()

    # FavoritesView has 20 spaces indent, others 16
    t = t.replace(
        "Color.clear\n                .ignoresSafeArea()", 
        replacement + "\n                .ignoresSafeArea()"
    )
    t = t.replace(
        "Color.clear\n                    .ignoresSafeArea()", 
        replacement + "\n                    .ignoresSafeArea()"
    )

    with open(path, 'w') as f:
        f.write(t)

c_home_story = """LinearGradient(
                colors: [Color("LightR"), Color(red: 0.42, green: 0.32, blue: 0.27), Color("DarkR")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )"""

c_fav_fun = """LinearGradient(
                colors: [Color(red: 0.11, green: 0.16, blue: 0.24), Color(red: 0.22, green: 0.30, blue: 0.42), Color(red: 0.42, green: 0.32, blue: 0.27)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )"""

process("/home/jose/Coding/AboutMe/AboutMe/HomeView.swift", c_home_story)
process("/home/jose/Coding/AboutMe/AboutMe/StoryView.swift", c_home_story)
process("/home/jose/Coding/AboutMe/AboutMe/FavoritesView.swift", c_fav_fun)
process("/home/jose/Coding/AboutMe/AboutMe/FunFactsView.swift", c_fav_fun)

