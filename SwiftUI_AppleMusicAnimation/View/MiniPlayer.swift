//
//  MiniPlayer.swift
//  SwiftUI_AppleMusicAnimation
//
//  Created by park kyung seok on 2021/08/10.
//

import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        
        VStack {
            
            HStack(spacing: 15) {
                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55)
                    .cornerRadius(15)
                
                Text("Lady Gaga")
                    .font(.title2)
                    .fontWeight(.bold)
            
                Spacer(minLength: 0)
                
                Button(action: { }) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.primary)
                }
                
                Button(action: { }) {
                    Image(systemName: "forward.fill")
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
            .frame(height: 80)
            .background(
                VStack(spacing: 0) {
                    BlurView()
                    
                    Divider()
                }
            )
            .offset(y: -48)
        }
    }
}

struct MiniPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayer()
    }
}
