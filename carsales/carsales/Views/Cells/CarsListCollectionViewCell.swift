//
//  CarsListCollectionViewCell.swift
//  carsales
//
//  Created by Sayalee Pote on 26/05/21.
//

import UIKit
import Kingfisher

class CarsListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    struct Constants {
        static let placeholderImageName = "imagePlaceholder"
    }
    
    // MARK: - Properties
    private var viewModel: CarsListCellViewModel?

    // MARK: - IBOutlets
    @IBOutlet weak var mainCarPhoto: UIImageView!
    @IBOutlet weak var carTitle: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    @IBOutlet weak var carLocation: UILabel!
    
    // MARK: - Setup
    func setupCarCell(car: Car) {
        viewModel = CarsListCellViewModel(car: car)
        
        carTitle.text = viewModel?.getCarTitle()
        carPrice.text = viewModel?.getCarPrice()
        carLocation.text = viewModel?.getCarLocation()
        
        if let carImageURL = viewModel?.getCarImageURL() {
            mainCarPhoto.kf.setImage(with: carImageURL)
        } else {
            mainCarPhoto.image = UIImage(named: Constants.placeholderImageName)
        }
    }
}
