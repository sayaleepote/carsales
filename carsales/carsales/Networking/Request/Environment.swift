//
//  Environment.swift
//  carsales
//
//  Created by Sayalee Pote on 25/05/21.
//

import Foundation

/// This struct encapsulates all the informations required to setup a environment for a request dispatcher
public struct Environment {
    var name: String = "debug"
    var base: String = "https://www.mocky.io"
    var headers: HTTPHeaders = [:]
    var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
}
