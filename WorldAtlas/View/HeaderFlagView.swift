//
//  FlagHeader.swift
//  WorldAtlas
//
//  Created by Maxim Tvilinev on 17.05.2023.
//

import UIKit

class HeaderFlagView: UIView {

    private let flagImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUI() {
        addSubview(flagImage)
        flagImage.contentMode = .scaleAspectFill
        flagImage.layer.cornerRadius = 8
        flagImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(-16)
            make.height.equalTo(193)
        }
    }

    func configure(flags: Flags) {
        DispatchQueue.global().async {
            guard
                let url = URL(string: flags.png),
                let data = try? Data(contentsOf: url)
            else {
                return
            }

            DispatchQueue.main.async {
                self.flagImage.image = UIImage(data: data)
            }
        }
    }

}
