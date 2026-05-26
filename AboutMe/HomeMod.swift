import SwiftUI


struct HomeMod: View {
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.11, green: 0.16, blue: 0.24), Color(red: 0.22, green: 0.30, blue: 0.42), Color(red: 0.42, green: 0.32, blue: 0.27)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 260, height: 260)
                .blur(radius: 32)
                .offset(x: 140, y: -240)

            Circle()
                .fill(Color.black.opacity(0.12))
                .frame(width: 320, height: 320)
                .blur(radius: 18)
                .offset(x: -150, y: 220)

            VStack(spacing: 128) {
                Text("iOS Dev")
                    .font(.largeTitle.weight(.heavy))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.5), radius: 6, x: 0, y: 4)

                ZStack {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 0.42, green: 0.28, blue: 0.17),
                                    Color(red: 0.24, green: 0.16, blue: 0.10)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: .black.opacity(0.45), radius: 18, x: 0, y: 12)

                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color(red: 0.94, green: 0.92, blue: 0.88))
                        .padding(4)

                    Image(information.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240, height: 240)
                        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                        .overlay(
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .stroke(Color.white.opacity(0.65), lineWidth: 3)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 22, style: .continuous)
                                .stroke(Color.black.opacity(0.10), lineWidth: 1)
                                .blur(radius: 1)
                                .offset(x: 1, y: 2)
                        )
                        .padding(26)
                }
                .frame(maxWidth: 320)
                .rotationEffect(.degrees(-3))

                Text(information.name)
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 8)
                    .background(.black.opacity(0.22), in: Capsule())
                    .overlay(
                        Capsule().stroke(.white.opacity(0.18), lineWidth: 1)
                    )
            }
            .padding(32)
        }
    }
    
}


struct HomeMod_Previews: PreviewProvider {
    static var previews: some View {
        HomeMod()
    }
}
