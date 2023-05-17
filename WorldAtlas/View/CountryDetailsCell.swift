//
//  CountryDetailsCell.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit

class CountryDetailsCell: UITableViewCell {

    static let ID = "CountryDetailsTableViewCell"

    private let titleLabel = UILabel()
    private let descriptionTitleLabel = UILabel()
    private let dotLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layoutUI()
        detailsUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUI() {
        contentView.addSubview(dotLabel)
        dotLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(-35)
            make.width.equalTo(24)
        }

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(48)
            make.top.equalToSuperview()
        }

        contentView.addSubview(descriptionTitleLabel)
        descriptionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(48)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.bottom.equalToSuperview().offset(-24)
        }
    }

    func configure(countryDetail: CountryDetail) {
        titleLabel.text = countryDetail.title
        descriptionTitleLabel.text = countryDetail.description
    }

    private func detailsUI() {
        titleLabel.text = "Region:"
        titleLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        titleLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)

        descriptionTitleLabel.text = "Astana"
        descriptionTitleLabel.font = UIFont(name: "SFProText-Regular", size: 20)
        descriptionTitleLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)

        dotLabel.text = "."
        dotLabel.font = UIFont(name: "SFProText-Semibold", size: 58)
        dotLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        dotLabel.textAlignment = .center
    }

}
