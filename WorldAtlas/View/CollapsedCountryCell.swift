//
//  DetailsCell.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit

class CollapsedCountryCell: UITableViewCell {

    static let ID = "CollapsedCountryCell"

    private let rectView = UIView()
    private let flagImage = UIImageView()
    private let countryNameLabel = UILabel()
    private let countryCapitalLabel = UILabel()
    private let expandButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collapsedMode()
        detailsCollapsedMode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func collapsedMode() {
        contentView.addSubview(rectView)
        rectView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }

        contentView.addSubview(flagImage)
        flagImage.snp.makeConstraints { make in
            make.leading.equalTo(rectView).offset(12)
            make.top.equalTo(rectView).offset(12)
            make.bottom.equalTo(rectView).offset(-12)
            make.width.equalTo(82)
            make.height.equalTo(48)
        }

        contentView.addSubview(expandButton)
        expandButton.snp.makeConstraints { make in
            make.trailing.equalTo(rectView).offset(-12)
            make.top.equalTo(rectView).offset(24)
            make.bottom.equalTo(rectView).offset(-24)
            make.size.equalTo(24)
        }

        contentView.addSubview(countryNameLabel)
        countryNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(flagImage.snp.trailing).offset(12)
            make.trailing.equalTo(expandButton.snp.leading).offset(-12)
            make.top.equalTo(rectView.snp.top).offset(16)
        }

        contentView.addSubview(countryCapitalLabel)
        countryCapitalLabel.snp.makeConstraints { make in
            make.leading.equalTo(flagImage.snp.trailing).offset(12)
            make.trailing.equalTo(expandButton.snp.leading).offset(-12)
            make.top.equalTo(countryNameLabel.snp.bottom).offset(4)
        }
    }

    private func detailsCollapsedMode() {
        rectView.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        rectView.layer.cornerRadius = 12

        flagImage.backgroundColor = UIColor(red: 78/255, green: 174/255, blue: 196/255, alpha: 1)
        flagImage.layer.cornerRadius = 8

        countryNameLabel.text = "Kazakhstan"
        countryNameLabel.numberOfLines = 0
        countryNameLabel.font = UIFont(name: "SFProText-Semibold", size: 17)
        countryNameLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)

        countryCapitalLabel.text = "Almaty"
        countryCapitalLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        countryCapitalLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)

        expandButton.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    }
}
