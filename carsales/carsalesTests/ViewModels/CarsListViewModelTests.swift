//
//  CarsListViewModelTests.swift
//  carsalesTests
//
//  Created by Sayalee Pote on 28/05/21.
//

import XCTest
@testable import carsales

class CarsListViewModelTests: XCTestCase {
    
    var sut: CarsListViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CarsListViewModel()
        sut.cars = [Car(id: "AD-5986160",
                        title: "2019 Mitsubishi Outlander ES ZL Auto 2WD MY19",
                        location: "SA",
                        price: "$31,680",
                        mainPhoto: "https://carsales.pxcrush.net/carsales/cars/dealer/ec9wqurk7wuve9izmk32sye8x.jpg",
                        detailsUrl: "/v3/2f29cf0a-c6d4-4e85-8848-bcad0cbc2417"),
                    Car(id: "AD-6011725",
                        title: "2019 BMW 330i M Sport G20 Auto",
                        location: "Victoria",
                        price: "$78,852",
                        mainPhoto: "https://carsales.pxcrush.net/carsales/cars/dealer/9r7b4lb0fzef9cb1t39imqjsz.jpg",
                        detailsUrl: "/v3/2141e78e-6ee1-4134-934e-0c2431c934ac")]
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetCarsCount() throws {
        let result = sut.getCarsCount()
        XCTAssertEqual(result, 2, "Cars count did not match")
    }
    
    func testGetCar() throws {
        let result = sut.getCar(at: 0)
        XCTAssertEqual(result.id, "AD-5986160", "Car at index did not match")
    }

}
