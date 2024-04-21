//
//  CharacterListViewCell.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import UIKit

final class CharacterListViewCell: UITableViewCell {
    static let id = String(describing: CharacterListViewCell.self)
    
    private lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [name, status])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var status: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        build()
    }
    
    func configure(imageURL: String, name: String, status: String, species: String) {
        setImage(with: imageURL)
        self.name.text = name
        self.status.text = "\(status) - \(species)"
    }
}

private extension CharacterListViewCell {
    func build() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(container)
        container.addSubview(image)
        container.addSubview(stackView)
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            image.topAnchor.constraint(equalTo: container.topAnchor),
            image.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 120),
            image.widthAnchor.constraint(equalToConstant: 120),
            image.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: container.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -8),
        ])
    }
    
    func setImage(with imageURL: String) {
        image.loadImage(with: imageURL)
        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.image.bounds,
                                    byRoundingCorners: [.topLeft, .bottomLeft],
                                    cornerRadii: CGSize(width: 8, height: 8))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.image.layer.mask = maskLayer
        }
    }
}
