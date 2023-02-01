//
//  DeliveryApi.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import Foundation

protocol DeliveryApiProtocol {
    func fetchRestaurants(_ completion: @escaping ([Restaurant]) -> Void)
    func searchAddresses(_ completion: @escaping ([Address]) -> Void)
    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetails) -> Void)
    func fetchMenuItem(_ completion: (MenuItemDetails) -> Void)
}

class DeliveryApi: DeliveryApiProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchRestaurants(_ completion: @escaping ([Restaurant]) -> Void) {
        networkManager.get(DeliveryRequest.restaurants) { (result: Result<[Restaurant], NetworkError>) in
            switch result {
            case .success(let restaurants):
                completion(restaurants)
            case .failure(let error):
                print(error)
            }
        }
    }

    func searchAddresses(_ completion: @escaping ([Address]) -> Void) {
        networkManager.get(DeliveryRequest.addresses) { (result: Result<[Address], NetworkError>) in
            switch result {
            case .success(let address):
                completion(address)
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchRestaurantDetails(_ completion: @escaping (RestaurantDetails) -> Void) {
        networkManager.get(DeliveryRequest.restaurantDetail) { (result: Result<RestaurantDetails, NetworkError>) in
            switch result {
            case .success(let restaurantDetails):
                completion(restaurantDetails)
            case .failure(let error):
                print(error)
            }
        }
    }

    func fetchMenuItem(_ completion: (MenuItemDetails) -> Void) {

        completion(MenuItemDetails())
    }
}
