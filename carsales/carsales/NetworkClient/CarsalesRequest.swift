//
//  CarsalesRequest.swift
//  carsales
//
//  Created by Sayalee Pote on 25/05/21.
//

import Foundation

/// Application specific request maker enum where each request could be an enum case. In this usecase we only have one API call to get the car details
enum CarsalesRequest: Request {
    case getCars
    
    var path: String {
        switch self {
        case .getCars:
            return "/v3/e8c52b55-7f44-41a8-b059-5d042269b520"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getCars:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getCars:
            return nil
        }
    }
    
    var requestParameterType: RequestParameterType? {
        switch self {
        case .getCars:
            return nil
        }
    }
}
