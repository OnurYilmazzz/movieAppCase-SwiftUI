//
//  ListMovieModel.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 25.08.2023.
//

import Foundation

struct MovieResponse: Decodable{
    let results: [Movie]
}
class ListMovieModel: ObservableObject {
    @Published var movies : [Movie] = []
    @Published var searchResults: [Movie] = []
    func fetchData() {
        let url = URL(string: "\(Constants.baseURl)/discover/movie?api_key=\(Constants.apiKey)")
   
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                do {
                   let decoder = JSONDecoder()
                    let result = try decoder.decode(MovieResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.movies = result.results
                    }
                } catch(let error) {
                    print(error)
                    return
                    }
            } else {
                print("error")
                return
            }
        }.resume()
    }
    
    func search(term: String) {
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(Constants.apiKey)&language=en-US&include_adult=false&query=\(term)".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movies = try decoder.decode(MovieResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.searchResults = movies.results
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

    
}
