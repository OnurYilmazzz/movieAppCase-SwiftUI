//
//  ContentView.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 22.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
               // HeaderView()
               // SearchBarView()
               //     .padding()
                
                TabBarView()
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
