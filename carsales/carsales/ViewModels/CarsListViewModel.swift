//
//  CarsListViewModel.swift
//  carsales
//
//  Created by Sayalee Pote on 25/05/21.
//

import Foundation

class CarsListViewModel {
    
    // MARK: - Constants
    struct Constants {
        static let environmentName = "debug"
        static let baseURL = "https://www.mocky.io"
    }
    
    // MARK: - Properties
    private var cars = [Car]()
    private let requestDispatcher = RequestDispatcher(environment: Environment(name: Constants.environmentName,
                                                                               base: Constants.baseURL))
    
    weak var delegate: CarsListViewModelDelegate?
    
    // MARK: - Methods
    func loadData() {
        delegate?.activityIndicator(isShown: true)
        do {
            try GetCarsOperation<[Car]>().execute(in: requestDispatcher, success: { (carsList) in
                self.cars = carsList
                self.delegate?.reloadCarsList()
                self.delegate?.activityIndicator(isShown: false)
            }, failure: { error in
                debugPrint(error)
                self.delegate?.activityIndicator(isShown: false)
            })
        } catch {
            delegate?.activityIndicator(isShown: false)
        }
    }
    
    func getCarsCount() -> Int {
        return cars.count
    }
    
    func getCar(at index: Int) -> Car {
        return cars[index]
    }
}
