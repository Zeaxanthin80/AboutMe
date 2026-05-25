//
//  FunFactsView.swift
//  AboutMe
//
//  Created by user on 5/24/26.
//

/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI
import UIKit

struct FunFactsView: View {

    @State private var funFact = ""
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.11, green: 0.16, blue: 0.24), Color(red: 0.22, green: 0.30, blue: 0.42), Color(red: 0.42, green: 0.32, blue: 0.27)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea()
            
            VStack {
                Text("Fun Facts")
                    .font(Font.custom("Marker Felt", size: 64))
                    //.font(.largeTitle)
                    //.fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.8), radius: 4, x: 0, y: 8)
            
                
                Text(funFact)
                    .padding()
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(minHeight: 400)
                
                Button("Show Random Fact") {
                    funFact = information.funFacts.randomElement()!
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 12)
                .background(.white.opacity(0.9), in: Capsule())
                .foregroundColor(.black)
                .overlay(
                    Capsule().stroke(.black.opacity(0.18), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.7), radius: 8, y: 6)
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.1))
        }
    }
}

struct FunFactsView_Previews: PreviewProvider {
    static var previews: some View {
        FunFactsView()
    }
}
