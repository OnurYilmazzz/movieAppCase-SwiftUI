//
//  CollectionItemView.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 26.08.2023.
//

import SwiftUI

struct CollectionItemView: View {
    var nameLabel: String
    var image: URL?
    
    var body: some View {
        VStack {
            if let imageURL = image {
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    
                    ProgressView()
                }
            } else {
                Text("No Image")
            }
            Text(nameLabel)
                .lineLimit(1)
                .truncationMode(.tail)
                
        }
    }
}
