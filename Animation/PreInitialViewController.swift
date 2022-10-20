//
//  PreInitialViewController.swift
//  Animation
//
//  Created by Aida on 19.10.2022.
//

import UIKit

class PreInitialViewController: UIViewController {

    var initialViewController = InitialViewController()
    
    var viewHeightConstraint: NSLayoutConstraint?
    var viewBottomConstraint: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.131503582, green: 0.1414976716, blue: 0.171200037, alpha: 1)
        setupChildViewController()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animatePresentViewController()
    }
    
    func animatePresentViewController() {
        UIView.animate(withDuration: 0.6) {
            self.viewBottomConstraint?.constant = 30
            UIView.animate(withDuration: 0.6,
                           delay: 1,
                           usingSpringWithDamping: 0.7,
                           initialSpringVelocity: 1,
                           options: .curveEaseIn) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private func setupChildViewController() {
        
        let guide = view.safeAreaLayoutGuide
        let height = guide.layoutFrame.size.height
        let defaultHeight: CGFloat = height - 100.0
        
        view.backgroundColor = #colorLiteral(red: 0.131503582, green: 0.1414976716, blue: 0.171200037, alpha: 1)
        initialViewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(initialViewController.view)
        addChild(initialViewController)
        initialViewController.didMove(toParent: self)
        
        initialViewController.view.layer.cornerRadius = 10.0
        initialViewController.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        NSLayoutConstraint.activate([
            initialViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            initialViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        viewHeightConstraint = initialViewController.view.heightAnchor.constraint(equalToConstant: defaultHeight)
        viewBottomConstraint = initialViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        viewHeightConstraint?.isActive = true
        viewBottomConstraint?.isActive = true
    }

}



