import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.42, green: 0.32, blue: 0.27),
                    Color("DarkR"),
                    Color(red: 0.42, green: 0.32, blue: 0.27)
                    ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea()
            
            VStack {
                Text("💾")
                    .font(.system(size: 96, weight: .bold))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
//                    .shadow(color: .white, radius: 64, x: 0, y: 0)
                    .shadow(color: .black, radius: 12, x: 0, y: 12)
                    
                
                ScrollView {
                    Text(information.story)
                        .font(.body)
                        .padding(32)
                        .padding(.top, 36)
                        .foregroundColor(.white)
                }
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.0),
                            .init(color: .black, location: 0.1),
                            .init(color: .black, location: 0.5),
                            .init(color: .clear, location: 1.0)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea(edges: .bottom)
                
            }
            .padding(.top, 50)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // .background(Image("binary-code"))
            .background(Color.black.opacity(0.1))
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
