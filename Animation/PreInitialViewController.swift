//
//  PreInitialViewController.swift
//  Animation
//
//  Created by Aida on 19.10.2022.
//

import UIKit

fileprivate struct Constants {
    static let areaForJusanEmblem: CGFloat = 65.0
    static let bottomHeightForBounce: CGFloat = 50.0
    static let viewCornerRadius: CGFloat = 10.0
    static let offsetFromTop: CGFloat = 72.0
}

fileprivate struct LayoutGuidance {
    static let offset: CGFloat = 16.0
    static let doNotMove: CGFloat = 0.0
}

class PreInitialViewController: UIViewController {

    private var initialViewController = InitialViewController()
    private var viewHeightConstraint: NSLayoutConstraint?
    private var viewBottomConstraint: NSLayoutConstraint?
    private var logoContainerViewXPosition: NSLayoutConstraint!
    private var logoContainerViewYPosition: NSLayoutConstraint!
    private var languageViewXPosition: NSLayoutConstraint!
    private var languageViewYPosition: NSLayoutConstraint!
    
    private let logoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector")
        image.alpha = 0
        return image
    }()
    
    private let jusanBuisnessImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector2")
        image.contentMode = .scaleAspectFill
        image.alpha = 0
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
        animate()
    }
    
    private func invokeAnimatedImageContainerView(moveUp: Bool, moveLeft: Bool, moveRight: Bool) {
         
        logoContainerViewXPosition.constant = moveLeft ? -(view.frame.width / 2 - logoContainerView.frame.width / 2 - LayoutGuidance.offset) : moveRight ? LayoutGuidance.offset / 2 : LayoutGuidance.doNotMove
        
        logoContainerViewYPosition.constant = moveUp ? -(view.frame.height / 2 - Constants.offsetFromTop) : logoContainerView.frame.height + LayoutGuidance.offset

        view.layoutSubviews()
    }
    
    private func invokeAnimatedLanguageView(isHidden: Bool) {
        languageViewYPosition = logoContainerViewYPosition
        languageView.isHidden = isHidden
        view.layoutSubviews()
    }
    
    private func animate() {
        /// LOGO appear
        UIView.animate(withDuration: 0.5, delay: 0.5) {
            self.jusanBuisnessImage.isHidden = true
            self.logoImage.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 0.7, delay: 0.3) {
            /// LOGO shrink
            self.logoContainerView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        } completion: { _ in
            /// LOGO to top
            UIView.animate(withDuration: 0.45, delay: 0.45) {
                self.invokeAnimatedImageContainerView(moveUp: true, moveLeft: false, moveRight: false)
            } completion: { _ in
                /// LOGO to right
                UIView.animate(withDuration: 0.7,
                               delay: 0,
                               usingSpringWithDamping: 0.6,
                               initialSpringVelocity: 0.5,
                               options: .curveEaseIn
                ) {
                    self.invokeAnimatedImageContainerView(moveUp: true, moveLeft: false, moveRight: true)
                    
                    //LOGO & JBuisness to left
                    UIView.animate(withDuration: 0.8,
                                   delay: 0.5,
                                   usingSpringWithDamping: 0.65,
                                   initialSpringVelocity: 0.5,
                                   options: .curveEaseIn
                    ) {
                        self.invokeAnimatedImageContainerView(moveUp: true, moveLeft: true, moveRight: false)
                        self.jusanBuisnessImage.isHidden = false
                        //JBuisness appear
                        UIView.animate(withDuration: 0.5, delay: 0.5) {
                            self.jusanBuisnessImage.alpha = 1.0
                        }
                     }
                 } completion: { _ in
                    //Language appear
                    UIView.animate(withDuration: 0.5, delay: 2) {
                        self.invokeAnimatedLanguageView(isHidden: false)
                        
                    } completion: { _ in
                        /// ChildViewController appear
                        UIView.animate(withDuration: 0.5, delay: 0.2) {
                            self.viewBottomConstraint?.constant = Constants.bottomHeightForBounce
                            UIView.animate(
                                withDuration: 0.7,
                                delay: 0.5,
                                usingSpringWithDamping: 0.65,
                                initialSpringVelocity: 0.5,
                                options: .curveEaseIn
                            ) {
                                self.view.layoutIfNeeded()
                            }
                        }
                     }
                  }
               }
            }
        }
    }
    
    private func setupUI() {
        [logoContainerView, languageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
      
        [logoImage, jusanBuisnessImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            logoContainerView.addSubview($0)
        }
        /// logoContainerView constraints init
        logoContainerViewXPosition = logoContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        logoContainerViewYPosition = logoContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        /// languageView constraints init
        languageViewXPosition = languageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        languageViewYPosition = languageView.centerYAnchor.constraint(equalTo: logoContainerView.centerYAnchor)
        
        NSLayoutConstraint.activate([
            logoContainerViewXPosition,
            logoContainerViewYPosition,
            logoContainerView.widthAnchor.constraint(equalToConstant: 80),
            logoContainerView.heightAnchor.constraint(equalToConstant: 80),
            
            logoImage.centerXAnchor.constraint(equalTo: logoContainerView.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: logoContainerView.centerYAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 80),
            logoImage.heightAnchor.constraint(equalToConstant: 80),
        
            jusanBuisnessImage.leftAnchor.constraint(equalTo: logoImage.rightAnchor, constant: 16),
            jusanBuisnessImage.centerYAnchor.constraint(equalTo: logoImage.centerYAnchor),
            jusanBuisnessImage.heightAnchor.constraint(equalToConstant: 60),
            jusanBuisnessImage.widthAnchor.constraint(equalToConstant: 154),
            
            languageViewYPosition,
            languageViewXPosition,
            languageView.widthAnchor.constraint(equalToConstant: 45),
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
        /// childViewController constraints init
        viewHeightConstraint = initialViewController.view.heightAnchor.constraint(equalToConstant: viewDefaultHeight)
        viewBottomConstraint = initialViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: viewDefaultHeight)
        viewHeightConstraint?.isActive = true
        viewBottomConstraint?.isActive = true
    }
}
