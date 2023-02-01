//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    var viewModel: RestaurantDetailsViewModelProtocol
    
    lazy var restaurantDeitailsView: RestaurantDetailsView = {
        let view = RestaurantDetailsView()
        view.menuListView.tableView.dataSource = self
        view.menuListView.tableView.delegate = self
        return view
    }()
    
    init(viewModel: RestaurantDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch {
            DispatchQueue.main.async {
                let restaurantDetail = self.viewModel.restaurantDetails
                self.restaurantDeitailsView.setup(restaurantDetail)
            }
        }
    }
    
    override func loadView() {
        self.view = restaurantDeitailsView
    }
}

extension RestaurantDetailsViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.restaurantDetails.menu.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCellView.cellIdentifier, for: indexPath) as! MenuCellView
        let item = viewModel.restaurantDetails.menu[indexPath.row]
        cell.setupCell(item)

        return cell
    }
}

extension RestaurantDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenuCellView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
