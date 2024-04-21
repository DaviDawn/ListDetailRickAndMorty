//
//  AlertCapable.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 20/4/24.
//

import UIKit

protocol AlertCapable: AnyObject {
    func showAlert(title: String, info: String)
    func hideAlert()
}

extension AlertCapable where Self: UIViewController {
    func showAlert(title: String, info: String) {
        let alert = AlertView()
        alert.configure(title: title, info: info)
        
        view.addSubview(alert)
        alert.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            alert.topAnchor.constraint(equalTo: self.view.topAnchor),
            alert.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            alert.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            alert.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        view.bringSubviewToFront(alert)
    }
    
    func hideAlert() {
        guard let alert = view.subviews.compactMap({ $0 as? AlertView }).first else { return }
        alert.removeFromSuperview()
    }
}
