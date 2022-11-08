//
//  LanguageChooserView.swift
//  Animation
//
//  Created by Aida on 07.11.2022.
//

import UIKit

final class LanguageChooserView: UIView {
    
    private lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.text = "RU"
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    private lazy var rightIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "icon_credit_down")
          imageView.tintColor = .white
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}

private extension LanguageChooserView {
    func configure() {
        [languageLabel, rightIconImageView].forEach {
          $0.translatesAutoresizingMaskIntoConstraints = false
          addSubview($0)
        }
          
        NSLayoutConstraint.activate([
          rightIconImageView.widthAnchor.constraint(equalToConstant: 24),
          rightIconImageView.heightAnchor.constraint(equalToConstant: 24),
          rightIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
          languageLabel.rightAnchor.constraint(equalTo: rightIconImageView.leftAnchor,
                             constant: -8),
          languageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

