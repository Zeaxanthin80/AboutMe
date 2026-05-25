import sys

def process(path, replacement):
    with open(path, 'r') as f:
        t = f.read()

    # The python script from before inserted the gradient with ignoresSafeArea.
    # We will just replace the whole LinearGradient block.
    # We will search for LinearGradient and replace until ignoresSafeArea()
    
    import re
    # Match the LinearGradient block up to ignoresSafeArea()
    pattern = r"LinearGradient\([^)]+\)\s*\.ignoresSafeArea\(\)"
    
    t = re.sub(pattern, replacement + "\n                .ignoresSafeArea()", t)
    
    # We might have indentation issues, but it should compile. Let's make sure Color.clear is properly used.
    # Wait, the string was just:
    # LinearGradient(
    #            colors: ...
    #        )
    #            .ignoresSafeArea()
    
    with open(path, 'w') as f:
        f.write(t)


process("/home/jose/Coding/AboutMe/AboutMe/HomeView.swift", "Color.clear")
process("/home/jose/Coding/AboutMe/AboutMe/StoryView.swift", "Color.clear")
process("/home/jose/Coding/AboutMe/AboutMe/FavoritesView.swift", "Color.clear")
process("/home/jose/Coding/AboutMe/AboutMe/FunFactsView.swift", "Color.clear")

