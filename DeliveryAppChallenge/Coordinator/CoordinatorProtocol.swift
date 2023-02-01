//
//  Coordinator Protocol.swift
//  DeliveryAppChallenge
//
//  Created by Bruno Nascimento Marques on 29/01/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    var parentCoordinator: AppCoordinator? { get set }
    func start()
}
