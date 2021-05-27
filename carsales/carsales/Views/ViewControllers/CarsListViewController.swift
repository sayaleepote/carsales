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
    private var collectionViewColumns: CGFloat = 1
    
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
        setupCollectionView()
    }
    
    // MARK: - Private setup methods
    private func loadCars() {
        viewModel.delegate = self
        viewModel.loadData()
    }
    
    private func setupCollectionView() {
        carsListCollectionView.dataSource = self
        carsListCollectionView.delegate = self
        collectionViewColumns = getCollectionViewColumns()
    }
    
    private func getCollectionViewColumns() -> CGFloat {
        switch view.traitCollection.horizontalSizeClass {
        case .regular:
            switch UIDevice.current.orientation {
            case .landscapeLeft, .landscapeRight:
                return 3
            default:
                return 2
            }
        default:
            return 1
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionViewColumns = getCollectionViewColumns()
        reloadCarsList()
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

// MARK: - UICollectionViewDelegateFlowLayout
extension CarsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellPadding = (collectionViewColumns - 1) * 10
        let width = (collectionView.frame.width - cellPadding) / collectionViewColumns
        return CGSize(width: width, height: width * 1.1)
    }
}

// MARK: - CarsListViewModelDelegate
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
