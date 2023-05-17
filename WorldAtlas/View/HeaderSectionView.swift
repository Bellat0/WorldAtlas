//
//  HeaderView.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit

class HeaderSectionView: UITableViewHeaderFooterView {

    static let ID = "HeaderView"

    private let titleLabel = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        layoutUI()
        detailsTitle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUI() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.bottom.equalTo(-8)
        }
    }

    private func detailsTitle() {
        titleLabel.font = UIFont(name: "SFProText-Bold", size: 15)
        titleLabel.textColor = UIColor(red: 171/255, green: 179/255, blue: 187/255, alpha: 1)
    }

    func details(title: String) {
        titleLabel.text = title.uppercased()
    }
}
