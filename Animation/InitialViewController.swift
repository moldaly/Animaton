//
//  InitialViewController.swift
//  Animation
//
//  Created by Aida on 19.10.2022.
//

import UIKit

final class InitialViewController: UIViewController {
    
    private lazy var countryView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "icon-world.pdf")
        imageView.layer.cornerRadius = 12.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .darkGray
        label.text = "Вход или регистрация"
        label.numberOfLines = 0
        return label
    }()
    
    private let iinTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.backgroundColor = .systemGray6
        textField.text = " ИИН"
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.text = " Номер телефона"
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private lazy var confirmTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.linkTextAttributes = [.foregroundColor: UIColor.systemOrange,
                                       .underlineStyle: 0]
        textView.text = "Продолжая, вы даете согласие на сбор и обработку персональных данных"
        return textView
    }()
    
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.setTitle("Продолжить", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var languageView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "Text.signIn"
        [descriptionLabel,
         iinTextField,
         phoneNumberTextField,
         countryView,
         confirmTextView,
         submitButton,
         languageView]
            .forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                  constant: 32.0),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                   constant: 16.0),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                    constant: -16.0)
        ])
        NSLayoutConstraint.activate([
            iinTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
                                              constant: 24.0),
            iinTextField.leftAnchor.constraint(equalTo: view.leftAnchor,
                                               constant: 68.0),
            iinTextField.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                constant: -16.0),
            iinTextField.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        NSLayoutConstraint.activate([
            countryView.topAnchor.constraint(equalTo: iinTextField.bottomAnchor,
                                             constant: 16.0),
            countryView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                              constant: 16.0),
            countryView.widthAnchor.constraint(equalToConstant: 40.0),
            countryView.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        NSLayoutConstraint.activate([
            phoneNumberTextField.topAnchor.constraint(equalTo: countryView.topAnchor),
            phoneNumberTextField.leftAnchor.constraint(equalTo: countryView.rightAnchor,
                                                       constant: 12),
            phoneNumberTextField.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                        constant: -16.0),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 40.0)
        ])
        NSLayoutConstraint.activate([
            confirmTextView.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor,
                                                 constant: 24.0),
            confirmTextView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                  constant: 16.0),
            confirmTextView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                   constant: -16.0),
            confirmTextView.heightAnchor.constraint(greaterThanOrEqualToConstant: 45.0)
        ])
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: confirmTextView.bottomAnchor,
                                              constant: 12.0),
            submitButton.leftAnchor.constraint(equalTo: view.leftAnchor,
                                               constant: 16.0),
            submitButton.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                constant: -16.0),
            submitButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        NSLayoutConstraint.activate([
            languageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                 constant: -32.0),
            languageView.leftAnchor.constraint(equalTo: view.leftAnchor,
                                               constant: 16.0),
            languageView.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                constant: -16.0),
            languageView.heightAnchor.constraint(equalToConstant: 60.0)
        ])

        iinTextField.updateConstraints()
    }
    
}
