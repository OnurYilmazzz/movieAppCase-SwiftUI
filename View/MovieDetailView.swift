//
//  MovieDetailView.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 11.09.2023.
//
import Foundation
import SwiftUI

struct MovieDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var model = MovieDetailsViewModel()
    let movie: Movie
    let headerHeight: CGFloat = 320
    
    
    let numberFormatter: NumberFormatter = {
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           formatter.groupingSeparator = "."
           return formatter
       }()
    
    var body: some View  {
        ZStack{
            Color(red:255/255,green:255/255,blue:255/255).ignoresSafeArea()
            
            GeometryReader { geo in
                VStack(spacing: 0) {
                    AsyncImage(url: movie.backdropURL){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: geo.size.width, maxHeight: headerHeight)
                   
                           
                        
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }placeholder: {
                        ProgressView()
                    }
                    }
                }
            ScrollView {
                VStack(spacing: 6){
                    Spacer()
                        .frame(height: headerHeight)
                    HStack {
                        Text(movie.title!)
                            .font(.title)
                            .fontWeight(.heavy)
                        Spacer()
                        
                    }
                 
                    HStack{
                        if let formattedPopularity = numberFormatter.string(from: NSNumber(value: movie.popularity)) {
                        Text(formattedPopularity)}
        
                        Spacer()
                        Text(movie.ratingText).foregroundColor(.yellow)
                        Text(movie.scoreText)
                        Spacer()
                    }
                    HStack{
                        Text("About Movie")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Text(movie.overview!)
                        
                        .foregroundColor(.secondary)
                    
                    HStack {
                        Text("Cast & Crew")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(model.castProfiles) { cast in
                               (CastView(cast: cast))
                            }
                        }
                    }
                }
                .padding()
            }

        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading){
            Button{
                dismiss()
            } label: {
                 Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await model.movieCredits(for: movie.id!)
            await model.loadCastProfiles()
        }

    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: .preview)
    }
}
