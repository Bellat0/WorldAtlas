//
//  CountryDetails.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit

struct CountryDetail {
    let title: String
    let description: String?
}

class CountryDetails: UIViewController {

    private let tableView = UITableView()
    private let headerView = HeaderFlagView(frame: CGRect(x: 0, y: 0, width: 343, height: 193))

    private var items = [CountryDetail]()

    private let country: Country

    let countriestListVc = CountriesList()

    init(country: Country) {
        let population = countriestListVc.formatPopulationNumber(country.population)
        let area = countriestListVc.formatAreaNumber(country.area)
        self.country = country
        items = [
            CountryDetail(title: "Region:", description: country.subregion),
            CountryDetail(title: "Capital:", description: country.capital?.first),
            CountryDetail(title: "Capital coordinates:", description: "\(country.capitalInfo.latlng!)"),
            CountryDetail(title: "Population:", description: "\(population)"),
            CountryDetail(title: "Area:", description: "\(area)"),
            CountryDetail(title: "Currency:", description: "Не смог распарсить :("),
            CountryDetail(title: "Timezones:", description: country.timezones.first)
        ]

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = country.name.common
        layoutUI()
        detailsTableView()
    }

    private func layoutUI() {
        headerView.configure(flags: country.flags)
        tableView.tableHeaderView = headerView

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func detailsTableView() {
        tableView.separatorStyle = .none

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(
            CountryDetailsCell.self,
            forCellReuseIdentifier: CountryDetailsCell.ID)
    }
}

//MARK: TableView Delegate

extension CountryDetails: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CountryDetailsCell.ID,
            for: indexPath
        ) as? CountryDetailsCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.configure(countryDetail: item)
        return cell
    }
}
