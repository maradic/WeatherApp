//
//  ViewController.swift
//  WeatherApp
//
//  Created by Marinko on 7/26/21.
//

import UIKit

class CitiesListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = CitiesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        tableView.removeSeparators()
        tableView.addRefreshWith(target: self, selector: #selector(fetchNewData))
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        presenter.refreshData()
    }
    
    @objc func fetchNewData() {
        presenter.refreshData()
    }
}

extension CitiesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = presenter.cities.count
        tableView.addEmptyStateMessageIfNeeded(message: "empty_cities_placeholder".localized, count: count)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as! CityTableViewCell
        CellConfigurator.configureCitiesCell(cell: cell, city: presenter.cities[indexPath.row])
        return cell
    }
}

extension CitiesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            presenter.deleteCity(cityAtIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

extension CitiesListViewController: CityPresenterDelegate {
    func refreshingStateChanged(isRefreshing: Bool) {
        if isRefreshing {
            tableView.refreshControl?.beginRefreshing()
        } else {
            tableView.refreshControl?.endRefreshing()
        }
    }
    
    func dataChanged() {
        tableView.reloadData()
    }
}
