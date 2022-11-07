//
//  PreInitialViewController.swift
//  Animation
//
//  Created by Aida on 19.10.2022.
//

import UIKit

fileprivate enum Constants {
    static let areaForJusanEmblem: CGFloat = 70.0
    static let bottomHeightForBounce: CGFloat = 50.0
    static let viewCornerRadius: CGFloat = 10.0
}

class PreInitialViewController: UIViewController {

    private var initialViewController = InitialViewController()
    private var viewHeightConstraint: NSLayoutConstraint?
    private var viewBottomConstraint: NSLayoutConstraint?

    private let logoImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let labelImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        return image
    }()
    
    private let jusanBuisnessImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector2")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var languageView: LanguageChooserView = {
       let view = LanguageChooserView()
        view.isHidden = true
       return view
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.131503582, green: 0.1414976716, blue: 0.171200037, alpha: 1)
        setupUI()
        setupChildViewController()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
    }

    private func animation() {
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.logoImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.jusanBuisnessImage.isHidden = true
        }
    
        completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.logoImageView.frame = CGRect(x: self.view.bounds.midX -                self.logoImageView.frame.width / 2,
                                                  y: self.logoImageView.frame.width + 20,
                                                  width: self.logoImageView.frame.width,
                                                  height: self.logoImageView.frame.height)
            }
        
            completion: { _ in
                self.jusanBuisnessImage.isHidden = false
                self.jusanBuisnessImage.alpha = 0.1
                UIView.animate(withDuration: 0.5, delay: 0.3) {
                    self.logoImageView.frame = CGRect(x: 16,
                                                   y: self.logoImageView.frame.height + 20,
                                                   width: self.logoImageView.frame.width,
                                                   height: self.logoImageView.frame.height)
                    self.jusanBuisnessImage.alpha = 3
                }
            
                completion: { _ in
                    UIView.animate(withDuration: 0.5, delay: 0.3) {
                       self.languageView.isHidden = false
                    }
                    
                    completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.viewBottomConstraint?.constant = Constants.bottomHeightForBounce
                            UIView.animate(withDuration: 0.8,
                                           delay: 1,
                                           usingSpringWithDamping: 0.65,
                                           initialSpringVelocity: 2,
                                           options: .curveEaseIn) {
                                self.view.layoutIfNeeded()
                            }
                             
                        }
        
                    }
                }
            }
        }
    }
    
    private func setupUI(){
        [logoImageView, languageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
      
        [logoImage, jusanBuisnessImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            logoImageView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 80),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),
        ])
      
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 80),
            logoImage.heightAnchor.constraint(equalToConstant: 80),
        
            jusanBuisnessImage.leftAnchor.constraint(equalTo: logoImage.rightAnchor, constant: 16),
            jusanBuisnessImage.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            jusanBuisnessImage.heightAnchor.constraint(equalToConstant: 60),
            jusanBuisnessImage.widthAnchor.constraint(equalToConstant: 154)
        ])
      
        NSLayoutConstraint.activate([
            languageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            languageView.widthAnchor.constraint(equalToConstant: 45),
            languageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            languageView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupChildViewController() {
        let guide = view.safeAreaLayoutGuide
        let safeAreaHeight = guide.layoutFrame.size.height
        let viewDefaultHeight: CGFloat = safeAreaHeight - Constants.areaForJusanEmblem
        
        initialViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(initialViewController.view)
        addChild(initialViewController)
        initialViewController.didMove(toParent: self)
        initialViewController.view.layer.cornerRadius = Constants.viewCornerRadius
        initialViewController.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        NSLayoutConstraint.activate([
            initialViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            initialViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        viewHeightConstraint = initialViewController.view.heightAnchor.constraint(equalToConstant: viewDefaultHeight)
        viewBottomConstraint = initialViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: viewDefaultHeight)
        viewHeightConstraint?.isActive = true
        viewBottomConstraint?.isActive = true
    }
}



