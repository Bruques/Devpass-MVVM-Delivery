//
//  AddressSearchViewModel.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 29/01/23.
//

import Foundation

protocol AddressSearchViewModelProtocol {
    var addresses: [Address] { get }
    func fetch(completion: @escaping () -> ())
    func finish()
}

class AddressSearchViewModel: AddressSearchViewModelProtocol {
    var addresses: [Address] = []
    
    var service: DeliveryApiProtocol
    
    weak var coordinator: AddressSearchCoordinator?
    
    init(service: DeliveryApiProtocol) {
        self.service = service
        
    }
    
    deinit {
        coordinator?.finish()
    }
    
    func fetch(completion: @escaping () -> ()) {
        service.searchAddresses { (addresses) in
            self.addresses = addresses
            completion()
        }
    }
    
    func finish() {
        
    }
}
