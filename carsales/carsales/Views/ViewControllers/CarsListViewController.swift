//
//  CarsListViewController.swift
//  carsales
//
//  Created by Sayalee Pote on 26/05/21.
//

import UIKit

protocol CarsListViewModelDelegate: class {
    func activityIndicator(isShown: Bool)
    func reloadCarsList()
}

class CarsListViewController: UIViewController {
    
    // MARK: - Constants
    struct Constants {
        static let carsListCollectionViewCellIdentifier = "CarsListCollectionViewCell"
        static let storyBoardName = "Main"
    }
    
    // MARK: - Properties
    private let viewModel: CarsListViewModel
    
    // MARK: - IBOutlets
    @IBOutlet weak var carsListCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - init
    required init?(coder: NSCoder) {
        viewModel = CarsListViewModel()
        super.init(coder: coder)
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCars()
        setupView()
    }
    
    // MARK: - Private setup methods
    private func loadCars() {
        viewModel.delegate = self
        viewModel.loadData()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Cars"
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        carsListCollectionView.dataSource = self
        carsListCollectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension CarsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getCarsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.carsListCollectionViewCellIdentifier,
                                                         for: indexPath) as? CarsListCollectionViewCell {
            let car = viewModel.getCar(at: indexPath.row)
            cell.setupCarCell(car: car)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

// MARK:- UICollectionViewDelegate
extension CarsListViewController: UICollectionViewDelegate {
    
}

extension CarsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: width * 1.1)
    }
}

// MARK: - MoviesListViewModelDelegate
extension CarsListViewController: CarsListViewModelDelegate {
    func activityIndicator(isShown: Bool) {
        DispatchQueue.main.async {
            if isShown {
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func reloadCarsList() {
        DispatchQueue.main.async {
            self.carsListCollectionView.reloadData()
        }
    }
}
