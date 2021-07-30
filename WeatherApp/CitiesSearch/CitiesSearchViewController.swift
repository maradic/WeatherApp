//
//  CitiesSearchViewController.swift
//  WeatherApp
//
//  Created by Marinko on 7/28/21.
//

import UIKit

class CitiesSearchViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishButton: ShrinkingButton!
    
    let presenter = SearchPresenter()
    
    private lazy var searchController:UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "searchbar_placeholder".localized
        searchController.searchBar.sizeToFit()
        searchController.searchBar.showsCancelButton = true
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.removeSeparators()
    
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.delegate = self
        view.clipsToBounds = true
        tableView.clipsToBounds = true
        presenter.delegate = self
        setupStyle()
    }
    
    private func setupStyle() {
        tableView.subviews.first?.backgroundColor = .clear
        finishButton.setTitle("finish".localized, for: .normal)
    }
    
    @IBAction func finishButtonTapped(_ sender: UIButton) {
        presenter.finishButtonTapped()
        searchController.dismiss(animated: true) {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}

extension CitiesSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        presenter.searchCities(cityName: searchText)
    }
}

extension CitiesSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCityTableViewCell") as! SearchCityTableViewCell
        CellConfigurator.configureSearchCell(cell: cell, geocode: presenter.cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cities.count
    }
}

extension CitiesSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.citySelected(index: indexPath.row)
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

extension CitiesSearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.isActive = false
        navigationController?.popViewController(animated: true)
    }
}

extension CitiesSearchViewController: SearchDelegate {
    func searchResultUpdated() {
        tableView.reloadData()
    }
    
    func showFinishButton(shouldShow: Bool) {
        finishButton.isHidden = !shouldShow
    }
}
