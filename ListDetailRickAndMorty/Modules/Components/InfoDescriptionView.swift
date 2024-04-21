//
//  InfoDescriptionView.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import UIKit

final class InfoDescriptionView: UIView {
    private lazy var info: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(info: String, name: String?) {
        self.info.text = info
        self.name.text = name
    }
}

private extension InfoDescriptionView {
    func build() {
        backgroundColor = .clear
        
        addSubview(info)
        addSubview(name)
        
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: topAnchor),
            info.leadingAnchor.constraint(equalTo: leadingAnchor),
            info.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            name.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 8),
            name.leadingAnchor.constraint(equalTo: info.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: info.trailingAnchor),
            name.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
