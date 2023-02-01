//
//  RestaurantDetailsViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 30/01/23.
//

import Foundation

protocol RestaurantDetailsViewModelProtocol {
    var restaurantDetails: RestaurantDetails { get }
    func fetch(completion: @escaping () -> ())
}

class RestaurantDetailsViewModel: RestaurantDetailsViewModelProtocol {
    var restaurantDetails: RestaurantDetails
    var service: DeliveryApiProtocol
    var coordinator: RestaurantDetailsCoordinator?
    
    init(service: DeliveryApiProtocol) {
        restaurantDetails = .makeEmpty()
        self.service = service
    }
    
    deinit {
        coordinator?.finish()
    }
    
    func fetch(completion: @escaping () -> ()) {
        service.fetchRestaurantDetails { (restaurantDetails) in
            self.restaurantDetails = restaurantDetails
            completion()
        }
    }
}
