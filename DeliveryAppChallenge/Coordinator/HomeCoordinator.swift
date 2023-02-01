//
//  HomeCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 29/01/23.
//

import Foundation
import UIKit

class HomeCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    weak var parentCoordinator: AppCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkManager = NetworkManager()
        
        let service = DeliveryApi(networkManager: networkManager)
        
        let homeViewModel = HomeViewModel(service: service)
        homeViewModel.coordinator = self
        
        let viewController = HomeViewController(viewModel: homeViewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func goToAddressSearch() {
        let coordinator = AddressSearchCoordinator(navigationController)
        coordinator.parentCoordinator = parentCoordinator
        parentCoordinator?.addChild(coordinator)
        coordinator.start()
    }
    
    func goToRestaurantDetails() {
        let coordinator = RestaurantDetailsCoordinator(navigationController)
        coordinator.parentCoordinator = parentCoordinator
        parentCoordinator?.addChild(coordinator)
        coordinator.start()
    }
}
