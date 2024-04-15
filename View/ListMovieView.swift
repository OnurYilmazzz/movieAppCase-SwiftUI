//
//  ListMovieView.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 25.08.2023.
//

import SwiftUI


struct ListMovieView: View {
    @State private var searchText: String = ""
    @ObservedObject var viewModel = ListMovieModel()
    
    var body: some View {
        NavigationView{
            ScrollView {
                if searchText.isEmpty {
                    if viewModel.movies.isEmpty {
                        
                    } else {
                        
                        
                        Spacer()
                            .frame(height: 10)
                        LazyVGrid(columns: [GridItem(.flexible(minimum: 180, maximum: 180),spacing: 16), GridItem(.flexible(minimum: 180, maximum: 180))], spacing: 16) {
                            
                            ForEach(viewModel.movies) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    CollectionItemView(nameLabel: movie.title! , image: movie.poster)
                                    
                                }
                                
                            }
                            .padding()
                            
                            
                            
                        }
                    }
                }
                else {
                    LazyVStack(){
                        ForEach(viewModel.searchResults) { item in
                            NavigationLink(destination: MovieDetailView(movie: item)){
                                HStack {
                                    AsyncImage(url: item.backdropURL){ image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100 , height: 120)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 100 , height: 120)
                                    }
                                    .clipped()
                                    .cornerRadius(10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(item.title ?? "")
                                            .foregroundColor(.gray)
                                            .font(.headline)
                                        HStack{
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.red)
                                            
                                            Text(String(format: "%.1f", item.vote_average))
                                            Spacer()
                                        }
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color(red:40/255,green:60/255,blue:104/255))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                            
                        }
                        
                        
                    }
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { newValue in
                if newValue.count > 2 {
                    viewModel.search(term: newValue)
                }
            }
            .onAppear {
                viewModel.fetchData()
                
                
            }
            .onDisappear {
                UIScrollView.appearance().isPagingEnabled = false
            }
        }
        
    }
    

}

struct ListMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ListMovieView()
    }
}
