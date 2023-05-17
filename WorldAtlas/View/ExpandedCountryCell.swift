//
//  ExpandedCountryCell.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit

class ExpandedCountryCell: UITableViewCell {

    static let ID = "ExpandedCountryCell"

//    var didTapLearMoreButton: (() -> Void)?

    private let rectView = UIView()
    private let flagImage = UIImageView()
    private let countryNameLabel = UILabel()
    private let countryCapitalLabel = UILabel()
    private let expandButton = UIButton()
    private let populationLabel = UILabel()
    private let populationNumberLabel = UILabel()
    private let areaLabel = UILabel()
    private let areaNumberLabel = UILabel()
    private let currenciesLabel = UILabel()
    private let currenciesNumberLabel = UILabel()
    private let learnMoreButton = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        expandedMode()
        detailsexpandedMode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func expandedMode() {
        contentView.addSubview(rectView)
        rectView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(216)
        }

        contentView.addSubview(flagImage)
        flagImage.snp.makeConstraints { make in
            make.leading.equalTo(rectView).offset(12)
            make.top.equalTo(rectView).offset(12)
            make.width.equalTo(82)
            make.height.equalTo(48)
        }

        contentView.addSubview(expandButton)
        expandButton.snp.makeConstraints { make in
            make.trailing.equalTo(rectView).offset(-12)
            make.top.equalTo(rectView).offset(24)
            make.size.equalTo(24)
        }

        contentView.addSubview(countryNameLabel)
        countryNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(flagImage.snp.trailing).offset(12)
            make.trailing.equalTo(expandButton.snp.leading).offset(-12)
            make.top.equalTo(rectView).offset(16)
        }

        contentView.addSubview(countryCapitalLabel)
        countryCapitalLabel.snp.makeConstraints { make in
            make.leading.equalTo(flagImage.snp.trailing).offset(12)
            make.top.equalTo(countryNameLabel.snp.bottom).offset(4)
        }

        contentView.addSubview(populationLabel)
        populationLabel.snp.makeConstraints { make in
            make.leading.equalTo(rectView).offset(12)
            make.top.equalTo(countryCapitalLabel.snp.bottom).offset(16)
        }

        contentView.addSubview(populationNumberLabel)
        populationNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(populationLabel.snp.trailing).offset(4)
            make.top.equalTo(countryCapitalLabel.snp.bottom).offset(16)
        }

        contentView.addSubview(areaLabel)
        areaLabel.snp.makeConstraints { make in
            make.leading.equalTo(rectView).offset(12)
            make.top.equalTo(populationLabel.snp.bottom).offset(8)
        }

        contentView.addSubview(areaNumberLabel)
        areaNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(areaLabel.snp.trailing).offset(4)
            make.top.equalTo(populationLabel.snp.bottom).offset(8)
        }

        contentView.addSubview(currenciesLabel)
        currenciesLabel.snp.makeConstraints { make in
            make.leading.equalTo(rectView).offset(12)
            make.top.equalTo(areaLabel.snp.bottom).offset(8)
        }

        contentView.addSubview(currenciesNumberLabel)
        currenciesNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(currenciesLabel.snp.trailing).offset(4)
            make.top.equalTo(areaLabel.snp.bottom).offset(8)
        }

        contentView.addSubview(learnMoreButton)
        learnMoreButton.snp.makeConstraints { make in
            make.centerX.equalTo(rectView)
            make.top.equalTo(currenciesNumberLabel.snp.bottom).offset(26)
//            make.bottom.equalTo(rectView.snp.bottom).offset(-26)
        }
//        learnMoreButton.addTarget(self, action: #selector(learnMoreTapped), for: .touchUpInside)
    }

    private func detailsexpandedMode() {
        rectView.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        rectView.layer.cornerRadius = 12

        flagImage.backgroundColor = UIColor(red: 78/255, green: 174/255, blue: 196/255, alpha: 1)
        flagImage.layer.cornerRadius = 8

        countryNameLabel.text = "Kazakhstan"
        countryNameLabel.font = UIFont(name: "SFProText-Semibold", size: 17)
        countryNameLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)

        countryCapitalLabel.text = "Almaty"
        countryCapitalLabel.font = UIFont(name: "SFProText-Regular", size: 13)
        countryCapitalLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)

        populationLabel.text = "Population:"
        populationLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        populationLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)

        populationNumberLabel.text = "19 mln"
        populationNumberLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        populationNumberLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)

        areaLabel.text = "Area:"
        areaLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        areaLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)

        areaNumberLabel.text = "2.725 mln kmº"
        areaNumberLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        areaNumberLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)

        currenciesLabel.text = "Currencies:"
        currenciesLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        currenciesLabel.textColor = UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)

        currenciesNumberLabel.text = "Tenge (T) (KZT)"
        currenciesNumberLabel.font = UIFont(name: "SFProText-Regular", size: 15)
        currenciesNumberLabel.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)

        learnMoreButton.setTitle("Learn more", for: .normal)
        learnMoreButton.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1), for: .normal)
        learnMoreButton.titleLabel?.font = UIFont(name: "SFProText-Semibold", size: 17)

        expandButton.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    }


}
