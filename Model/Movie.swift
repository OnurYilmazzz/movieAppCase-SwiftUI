//
//  Movies.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 25.08.2023.
//

import Foundation

// Movie = TrendingItem no tutorial
struct Movie: Identifiable, Decodable {
    let adult: Bool
    let id: Int?
    let poster_path: String?
    let title: String?
    let overview: String?
    var vote_average: Float
    let backdrop_path: String?
    let popularity: Double
    
    
    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path ?? "" )
    }

    var posterThumbnail: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path ?? "" )
    }

    var poster: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: poster_path ?? "" )
    }
   
    
    
    var ratingText: String {
        let rating = Int(vote_average)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "⭐️"
        }
        return ratingText
    }
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    static var preview: Movie {
        return Movie(adult: false,
                     id: 23834,
                     poster_path: "https://image.tmdb.org/t/p/w300",
                     title:"Free Guy",
                     overview: "some demo text here",
                     vote_average: 5.5,
                     backdrop_path: "https://image.tmdb.org/t/p/w300",
                     popularity: 123.234
                    )
    }

}
