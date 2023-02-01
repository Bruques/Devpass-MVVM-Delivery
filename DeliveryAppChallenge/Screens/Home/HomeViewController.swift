//
//  ViewController.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 25/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel:HomeViewModelProtocol
    
    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.restaurantListView.tableView.dataSource = self
        homeView.restaurantListView.tableView.delegate = self
        homeView.addressView.editButton.addTarget(self, action: #selector(tapEditButton), for: .touchUpInside)
        return homeView
    }()

    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)

        navigationItem.title = "Delivery App 🍕"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.viewModel.fetch {
            DispatchQueue.main.async {
                self.homeView.restaurantListView.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    @objc private func tapEditButton() {
        viewModel.didTapEditButton()
    }
}

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.restaurants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantCellView.cellIdentifier, for: indexPath) as! RestaurantCellView
        cell.setupCell(viewModel.restaurants[indexPath.row])

        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RestaurantCellView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didTapRestaurantCell()
    }
}
