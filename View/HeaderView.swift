//
//  HeaderView.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 25.08.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 4) {
                Text("MovieFO")
                    .foregroundColor(Color.white)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.ignoresSafeArea(edges: .top))
        .font(.headline)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HeaderView()
            Spacer()
        }
    }
}
