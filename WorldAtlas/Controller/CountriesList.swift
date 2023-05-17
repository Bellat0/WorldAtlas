//
//  ViewController.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit
import SnapKit

class CountriesList: UIViewController {

    private let networdManager = NetworkManager()

    private let tableView = UITableView()
    private var item = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        detailsUI()

        networdManager.fetchData { item in
            DispatchQueue.main.async {
                self.item = item
                self.tableView.reloadData()
            }
        }
    }

    private func layoutUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func detailsUI() {
        tableView.separatorStyle = .none

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            CollapsedCountryCell.self,
            forCellReuseIdentifier: CollapsedCountryCell.ID)
        tableView.register(
            ExpandedCountryCell.self,
            forCellReuseIdentifier: ExpandedCountryCell.ID)

        tableView.register(
            HeaderSectionView.self,
            forHeaderFooterViewReuseIdentifier: HeaderSectionView.ID)
    }

    //MARK: Functions for Population and Area numbers

    func formatPopulationNumber(_ number: Int) -> String {
        let million = 1_000_000

        if number >= million {
            let formattedNumber = Double(number) / Double(million)
            return String(format: "%.0f", formattedNumber) + " mln"
        } else {
            let formattedNumber = Double(number) / Double(million)
            return String(format: "%.6f", formattedNumber) + " mln"
        }
    }

    func formatAreaNumber(_ area: Double) -> String {
        let million = 1_000_000.0

        if area >= million {
            let formattedArea = Double(area) / Double(million)
            return String(format: "%.3f", formattedArea) + " mln km²"
        } else {
            let formattedArea = Double(area) / Double(million)
            return String(format: "%.6f", formattedArea) + " mln km²"
        }
    }
}

//MARK: TableView Delegate

extension CountriesList: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return item.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item[section].country.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = item[indexPath.section].country[indexPath.row]

        if country.isExpanded {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ExpandedCountryCell.ID,
                for: indexPath
            ) as? ExpandedCountryCell else { return UITableViewCell() }

            cell.configure(item: country, isExpanded: country.isExpanded)
            
            return cell

        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CollapsedCountryCell.ID,
                for: indexPath
            ) as? CollapsedCountryCell else { return UITableViewCell() }

            cell.configureCell(item: country, isExpanded: country.isExpanded)

            return cell
        }
    }

    //MARK: HeaderView

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionHeader = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderSectionView.ID
        ) as? HeaderSectionView else { return nil }

        sectionHeader.details(title: item[section].continent.rawValue)
        return sectionHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }

    //MARK: DidSelectRow

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        item[indexPath.section].country[indexPath.row].isExpanded.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
