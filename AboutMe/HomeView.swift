//
//  HomeView.swift
//  AboutMe
//
//  Created by user on 5/24/26.
//

/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
            
            VStack {
                
                Text(information.title)
                    .font(.system(size: 72,))
                    .padding()
                    .overlay(
                        LinearGradient(
                            colors: [.black, .black.opacity(0.8)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .mask(
                        Text(information.title)
                            .font(.system(size: 72, weight: .bold))
                    )
                    .shadow(color: Color.white.opacity(0.2), radius: 8, x: 0, y: -16)
                    .shadow(color: Color.white.opacity(0.3), radius: 4, x: 0, y: -8)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 16)
                    .shadow(color: Color.black.opacity(0.4), radius: 4, x: 0, y: 8)
                
                Image(information.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(64)
                    .overlay(
                        RoundedRectangle(cornerRadius: 64)
                            .stroke(Color.white.opacity(0.18), lineWidth: 1)
                    )
                    .padding(64)
                    .shadow(color: Color.black, radius: 32, x: 0, y: 24)
                
                Text(information.name)
                //  .font(.title)
                    .font(Font.largeTitle.lowercaseSmallCaps())
                    .foregroundColor(.white)
                    .shadow(color:.black, radius: 8, x: 0, y: 8)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(.black.opacity(0.22), in: Capsule())
                    .overlay(
                        Capsule().stroke(.white.opacity(0.18), lineWidth: 1)
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.1))
            
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
