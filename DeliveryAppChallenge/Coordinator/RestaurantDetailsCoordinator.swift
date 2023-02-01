//
//  RestaurantDetailsCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 30/01/23.
//

import Foundation
import UIKit

class RestaurantDetailsCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    
    var parentCoordinator: AppCoordinator?
    
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let networkManager = NetworkManager()
        
        let service = DeliveryApi(networkManager: networkManager)
        
        let viewModel = RestaurantDetailsViewModel(service: service)
        viewModel.coordinator = self
        
        let viewController = RestaurantDetailsViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func finish() {
        parentCoordinator?.removeChild(self)
    }
}
