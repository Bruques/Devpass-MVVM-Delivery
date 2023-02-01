//
//  AppCoordinator.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 29/01/23.
//

import Foundation
import UIKit

class AppCoordinator {
    var childCoordinators: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let childCoordinator: CoordinatorProtocol = HomeCoordinator(navigationController: self.navigationController)
        
        addChild(childCoordinator)
        
        childCoordinator.start()
    }
    
    func addChild(_ child: CoordinatorProtocol) {
        child.parentCoordinator = self
        childCoordinators.append(child)
    }
    
    func removeChild(_ child: CoordinatorProtocol?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if child === coordinator {
                childCoordinators.remove(at: index)
            }
        }
    }
}
