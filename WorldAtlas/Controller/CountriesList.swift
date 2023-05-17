//
//  ViewController.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit
import SnapKit

class CountriesList: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        layoutUI()
        detailsUI()
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
}

//MARK: TableView Delegate

extension CountriesList: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: CollapsedCountryCell.ID,
//            for: indexPath
//        ) as? CollapsedCountryCell else { return UITableViewCell() }
//
//        return cell

        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ExpandedCountryCell.ID,
            for: indexPath
        ) as? ExpandedCountryCell else { return UITableViewCell() }

        return cell
    }

    //MARK: HeaderView

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionHeader = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderSectionView.ID
        ) as? HeaderSectionView else { return nil }

        sectionHeader.details(title: "SectionTitle")
        return sectionHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
}
