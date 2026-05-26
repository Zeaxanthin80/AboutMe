import SwiftUI
internal import Combine

struct FloatingText: Identifiable {
    let id = UUID()

    var x: CGFloat
    var y: CGFloat

    var opacity: Double
    var scale: CGFloat

    var fontSize: CGFloat
    var color: Color
    var message: String
}

struct FavoritesView: View {

    @State private var texts: [FloatingText] = []

    let timer = Timer.publish(
        every: 0.1,
        on: .main,
        in: .common
    ).autoconnect()

    let phrases = [
        "Hello World!",
        "MDC",
        "✨",
        //"🚀",
        //"Code"
    ]

    let colors: [Color] = [
        .white,
        .blue,
        .red,
        .yellow,
        .green,
        .orange,
        .purple,
        .mint
    ]

    var body: some View {

        GeometryReader { geo in

            ZStack {

                LinearGradient(
                colors: [
                    Color(red: 0.11, green: 0.16, blue: 0.24),
                    Color(red: 0.22, green: 0.30, blue: 0.42),
                    Color(red: 0.42, green: 0.32, blue: 0.27)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                    .ignoresSafeArea()

                // Floating particles
                ForEach(texts) { text in

                    Text(text.message)

                        // RANDOM FONT SIZE
                        .font(.system(size: text.fontSize, weight: .bold))

                        // RANDOM COLOR
                        .foregroundColor(text.color)

                        // RANDOM OPACITY
                        .opacity(text.opacity)

                        .scaleEffect(text.scale)

                        .position(x: text.x, y: text.y)
                }
                .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 6)
            }

            .onReceive(timer) { _ in
                spawnText(in: geo.size)
            }
        }
    }

    func spawnText(in size: CGSize) {

        let newText = FloatingText(

            x: CGFloat.random(in: 0...size.width),

            y: size.height + 50,

            opacity: Double.random(in: 0.4...1.0),

            scale: CGFloat.random(in: 0.7...4.0),

            fontSize: CGFloat.random(in: 16...42),

            color: colors.randomElement() ?? .white,

            message: phrases.randomElement() ?? "Hello"
        )

        texts.append(newText)

        guard let index = texts.indices.last else { return }

        // Animate upward
        withAnimation(.easeOut(duration: Double.random(in: 2...5))) {

            texts[index].y = -50

            texts[index].opacity = 0

            texts[index].scale *= 0.6
        }

        // Cleanup
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {

            texts.removeAll { $0.id == newText.id }
        }
    }
}

#Preview {
    FavoritesView()
}
