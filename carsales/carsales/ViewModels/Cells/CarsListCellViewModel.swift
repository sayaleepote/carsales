//
//  CarsListCellViewModel.swift
//  carsales
//
//  Created by Sayalee Pote on 27/05/21.
//

import Foundation

/// View model for views that need car related information
class CarsListCellViewModel {
    let car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    func getCarTitle() -> String? {
        return car.title
    }
    
    func getCarPrice() -> String? {
        return car.price
    }
    
    func getCarLocation() -> String? {
        return car.location
    }
    
    func getCarImageURL() -> URL? {
        if let carImageURL = car.mainPhoto,
           let url = URL(string: carImageURL) {
            return url
        }
        return nil
    }
}
