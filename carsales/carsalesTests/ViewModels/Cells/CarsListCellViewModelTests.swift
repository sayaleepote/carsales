//
//  CarsListCellViewModelTests.swift
//  carsalesTests
//
//  Created by Sayalee Pote on 28/05/21.
//

import XCTest
@testable import carsales

class CarsListCellViewModelTests: XCTestCase {
    
    var sut: CarsListCellViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let car = Car(id: "AD-5986160",
                      title: "2019 Mitsubishi Outlander ES ZL Auto 2WD MY19",
                      location: "SA",
                      price: "$31,680",
                      mainPhoto: "https://carsales.pxcrush.net/carsales/cars/dealer/ec9wqurk7wuve9izmk32sye8x.jpg",
                      detailsUrl: "/v3/2f29cf0a-c6d4-4e85-8848-bcad0cbc2417")
        sut = CarsListCellViewModel(car: car)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testGetCarTitle() throws {
        let result = sut.getCarTitle()
        XCTAssertEqual(result, "2019 Mitsubishi Outlander ES ZL Auto 2WD MY19", "Car title did not match")
    }
    
    func testGetCarPrice() throws {
        let result = sut.getCarPrice()
        XCTAssertEqual(result, "$31,680", "Car price did not match")
    }
    
    func testGetCarLocation() throws {
        let result = sut.getCarLocation()
        XCTAssertEqual(result, "SA", "Car location did not match")
    }
    
    func testGetCarImageURL() throws {
        let result = sut.getCarImageURL()
        let expectedURL = URL(string: "https://carsales.pxcrush.net/carsales/cars/dealer/ec9wqurk7wuve9izmk32sye8x.jpg")
        XCTAssertEqual(result, expectedURL, "Car main photo url did not match")
    }
    
    func testGetInvalidImageURL() throws {
        let car = Car(id: "AD-5986160",
                      title: "2019 Mitsubishi Outlander ES ZL Auto 2WD MY19",
                      location: "SA",
                      price: "$31,680",
                      mainPhoto: "Invalid URL",
                      detailsUrl: "/v3/2f29cf0a-c6d4-4e85-8848-bcad0cbc2417")
        sut = CarsListCellViewModel(car: car)
        let result = sut.getCarImageURL()
        XCTAssertNil(result, "Car main photo url is not nil")
    }

}
