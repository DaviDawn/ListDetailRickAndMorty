//
//  LoaderCapable.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import UIKit

protocol LoaderCapable: AnyObject {
    func showLoader()
    func hideLoader()
}

extension LoaderCapable where Self: UIViewController {
    func showLoader() {
        let loader = UIActivityIndicatorView()
        
        view.addSubview(loader)
        loader.backgroundColor = .white
        loader.alpha = 0.7
        loader.style = .large
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loader.topAnchor.constraint(equalTo: view.topAnchor),
            loader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loader.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        loader.startAnimating()
    }
    
    func hideLoader() {
        guard let loader = view.subviews.compactMap({ $0 as? UIActivityIndicatorView }).first else { return }
        loader.removeFromSuperview()
    }
}
