//
//  AlertView.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 20/4/24.
//

import UIKit

final class AlertView: UIView {
    private lazy var content: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var info: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    func configure(title: String, info: String) {
        self.title.text = title
        self.info.text = info
    }
}

private extension AlertView {
    func build() {
        backgroundColor = .darkGray
        addSubview(content)
        content.addSubview(title)
        content.addSubview(info)
        
        NSLayoutConstraint.activate([
            content.centerXAnchor.constraint(equalTo: centerXAnchor),
            content.centerYAnchor.constraint(equalTo: centerYAnchor),
            content.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16),
            content.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            title.topAnchor.constraint(equalTo: content.topAnchor, constant: 16),
            title.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -16),
            
            info.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            info.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            info.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            info.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -16)
        ])
    }
}
