//
//  ErrorRequestModel.swift
//  MovieInfo
//
//  Created by singgih on 07/10/20.
//

import Foundation

enum ErrorRequestModel: Error {
    case message(String)
    case other(Error)
    
    static func map(_ error: Error) -> ErrorRequestModel {
        return (error as? ErrorRequestModel) ?? .other(error)
    }
}

extension ErrorRequestModel: CustomStringConvertible {
    var description: String {
        switch self {
        case .message(let message):
            return message
        case .other(let error):
            return error.localizedDescription
        }
    }
}

