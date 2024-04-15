//
//  TabBarView.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 25.08.2023.
//

import SwiftUI

struct TabBarView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }
    
    var body: some View {
        
            TabView {
                ListMovieView()
                
                    .tabItem {
                        Image(systemName: "house").renderingMode(.template)
                        Text("Main Page")
                    }
                FavoriteListView()
                    .tabItem {
                        Image(systemName: "star").renderingMode(.template)
                            
                        Text("Popular")
                }
            }
            .accentColor(.black)
        }
    }

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
