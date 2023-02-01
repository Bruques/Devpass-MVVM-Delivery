//
//  HomeViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 29/01/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var restaurants: [Restaurant] { get }
    func fetch(completion: @escaping () -> ())
    func didTapEditButton()
    func didTapRestaurantCell()
}

class HomeViewModel: HomeViewModelProtocol {
    var restaurants: [Restaurant] = []
    
    var service: DeliveryApiProtocol
    
    weak var coordinator: HomeCoordinator?
    
    init(service: DeliveryApiProtocol) {
        self.service = service
    }
    
    func fetch(completion: @escaping () -> ()) {
        self.service.fetchRestaurants { (restaurants) in
            self.restaurants = restaurants
            completion()
        }
    }
    
    func didTapEditButton() {
        coordinator?.goToAddressSearch()
    }
    
    func didTapRestaurantCell() {
        coordinator?.goToRestaurantDetails()
    }
}
