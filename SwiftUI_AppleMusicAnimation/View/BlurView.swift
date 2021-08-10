//
//  BlurView.swift
//  SwiftUI_AppleMusicAnimation
//
//  Created by park kyung seok on 2021/08/10.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
   
    func makeUIView(context: Context) -> UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}
