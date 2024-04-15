//
//  ErrorResponse.swift
//  MovieAppCaseFO
//
//  Created by Onur YILMAZ on 25.08.2023.
//
import Foundation

struct ErrorResponse: Decodable {
    var status_message: String
    var status_code: Int
}
