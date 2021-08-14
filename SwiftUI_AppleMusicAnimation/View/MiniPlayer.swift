//
//  MiniPlayer.swift
//  SwiftUI_AppleMusicAnimation
//
//  Created by park kyung seok on 2021/08/10.
//

import SwiftUI

struct MiniPlayer: View {
    
    var animation: Namespace.ID
    
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
    
    // Volume Slider
    @State var volume: CGFloat = 0
        
    // Gesture offset
    @State var offset: CGFloat = 0
    
    let iconHeight: CGFloat = 55
    let iconExpendedHeight: CGFloat = UIScreen.main.bounds.height / 3
    
    @Binding var isExpended: Bool
    
    var body: some View {
        
        VStack {
                   
            Capsule()
                .fill(Color.gray)
                .frame(width: isExpended ? 60 : 0, height: isExpended ? 4 : 0)
                .opacity(isExpended ? 1 : 0)
                .padding(.top, isExpended ? 30 : 0)
                .padding(.vertical, isExpended ? 30: 0)
            
            HStack(spacing: 15) {
                
                if isExpended { Spacer(minLength: 0) }

                Image("pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: isExpended ? iconExpendedHeight : iconHeight, height: isExpended ? iconExpendedHeight : iconHeight)
                    .cornerRadius(15)
                
                if !isExpended {
                    Text("Lady Gaga")
                        .font(.title2)
                        .fontWeight(.bold)
                        .matchedGeometryEffect(id: "Label", in: animation)
                }
              
                Spacer(minLength: 0)
                
                if !isExpended {
                    Button(action: { }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(.primary)
                    }
                    
                    Button(action: { }) {
                        Image(systemName: "forward.fill")
                            .foregroundColor(.primary)
                    }
                }
               
            }
            .padding(.horizontal)
            
            VStack(spacing: 15) {
                
                Spacer(minLength: 0)
                
                //titles under pic
                HStack {
                    
                    if isExpended {
                        Text("Lady Gaga")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "Label", in: animation)
                        
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: { }) {
                        Image(systemName: "ellipsis.circle")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                   
                }
                .padding()
                
                // Live String
                HStack {
                    
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.7), Color.primary.opacity(0.1)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        )
                        .frame(height: 4)
                    
                    Text("LIVE")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Capsule()
                        .fill(
                            LinearGradient(gradient: .init(colors: [Color.primary.opacity(0.7), Color.primary.opacity(0.1)]), startPoint: .trailing, endPoint: .leading)
                        )
                        .frame(height: 4)
                }
                .padding()
                
                
                // Stop Button
                Button(action: { }) {
                    Image(systemName: "stop.fill")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                }
                .padding()
                
                Spacer(minLength: 0)
                
                // Volume
                HStack(spacing: 15) {
                    Image(systemName: "speaker.fill")
                    
                    Slider(value: $volume)
                    
                    Image(systemName: "speaker.wave.2.fill")
                }
                .padding()
                
                HStack(spacing: 22) {
                    
                    Button(action: { }) {
                        
                        Image(systemName: "arrow.up.message")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Button(action: { }) {
                        
                        Image(systemName: "airplayaudio")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Button(action: { }) {
                        
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.bottom, safeArea?.bottom == 0 ? 15 : safeArea?.bottom)
            }
            .frame(width: isExpended ? nil : 0, height: isExpended ? nil : 0)
            .opacity(isExpended ? 1 : 0)
           
        }
        .frame(maxHeight: isExpended ? .infinity :  80)
        .background(
            VStack(spacing: 0) {
                BlurView()
                
                Divider()
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    isExpended = true
                }
            }
        )
        .cornerRadius(isExpended ? 20 : 0)
        .ignoresSafeArea()
        .offset(y: isExpended ? 0 : -48)
        // DragGestureによるoffsetをbindしてDragした分画面をoffsetする
        .offset(y: offset)
        .gesture(DragGesture().onEnded(onEnded).onChanged(onChanged))
    }
    
    func onChanged(value: DragGesture.Value) {
        
        print(value.translation.height)
        
        // 画面のoffsetは isExpendedのみ
        if value.translation.height > 0 && isExpended {
            offset = value.translation.height
        }
    }
    
    func onEnded(value: DragGesture.Value) {
        
        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.95, blendDuration: 0.95)) {
            
            // Dragしたoffsetが画面の半分を超えた場合には閉じる
            if value.translation.height > UIScreen.main.bounds.height / 2 {
                isExpended = false
            }
            // Dragging did endの場合、画面をoffsetした分、戻す（bounceのようなイメージ）
            offset = 0
        }
    }
}

//struct MiniPlayer_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniPlayer()
//    }
//}
