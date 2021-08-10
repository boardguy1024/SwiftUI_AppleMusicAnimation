//
//  TabBar.swift
//  SwiftUI_AppleMusicAnimation
//
//  Created by park kyung seok on 2021/08/10.
//

import SwiftUI

struct TabBar: View {
    
    // Selected Tab Index
    // Default is third
    @State var currentTab = 2
    
    var body: some View {
        
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            
            TabView(selection: $currentTab,
                    content:  {
                        Text("Library")
                            .tag(0)
                            .tabItem {
                                Image(systemName: "rectangle.stack.fill")
                                Text("Library")
                            }
                        
                        Text("Radio")
                            .tag(1)
                            .tabItem {
                                Image(systemName: "dot.radiowaves.left.and.right")
                                Text("Radio")
                            }
                        
                        Text("Search")
                            .tag(2)
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                    })
            
           MiniPlayer()
        })
        
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
