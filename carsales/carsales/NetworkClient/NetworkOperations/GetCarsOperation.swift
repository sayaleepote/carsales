//
//  GetCarsOperation.swift
//  carsales
//
//  Created by Sayalee Pote on 25/05/21.
//

import Foundation

class GetCarsOperation<Cars>: Operation {

    var request: Request {
        return CarsalesRequest.getCars
    }
    
    func execute(in dispatcher: RequestDispatcher,
                 success: @escaping ([Car]) -> Void,
                 failure: @escaping (NetworkError) -> Void) throws {
        try dispatcher.execute(request: request, completion: { response in
            switch response {
            case .data(let data):
                do {
                    let cars = try self.decodeJson(jsonData: data)
                    success(cars)
                } catch {
                    failure(error as! NetworkError)
                }
            case .error(let error):
                failure(error)
            }
        })
    }
    
    // MARK: - Private methods
    private func decodeJson(jsonData: Data) throws -> [Car] {
        do {
            let decodedJson = try JSONDecoder().decode(Result.self, from: jsonData)
            return decodedJson.result
        } catch {
            throw NetworkError.jsonDecodingFailed
        }
    }
}
