//
//  CharacterDetailViewController.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import UIKit
import Combine

final class CharacterDetailViewController: UIViewController {
    private let viewModel: CharacterDetailViewModel
    private var cancellables: Set<AnyCancellable>
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy  var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 16
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var status: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var origin: InfoDescriptionView = {
        InfoDescriptionView()
    }()
    
    private lazy var species: InfoDescriptionView = {
        InfoDescriptionView()
    }()
    
    private lazy var lastPlace: InfoDescriptionView = {
        InfoDescriptionView()
    }()
    
    private lazy var gender: InfoDescriptionView = {
        InfoDescriptionView()
    }()
    
    private lazy var clearView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        self.cancellables = Set<AnyCancellable>()
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

private extension CharacterDetailViewController {
    func bind() {
        viewModel
            .state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                switch state {
                case .idle:
                    self?.showLoader()
                    self?.build()
                    self?.viewModel.viewDidLoad()
                case .loadCharacter:
                    self?.hideLoader()
                    self?.configureViews()
                case .alertError:
                    self?.hideLoader()
                    self?.showAlert(title: "GenericErrorTitle".localized, info: "GenericErrorInformation".localized)
                }
            }.store(in: &cancellables)
    }
    
    func build() {
        title = "CharacterDetailNavigationTitle".localized
        view.backgroundColor = .darkGray
        
        view.addSubview(scrollView)
        scrollView.addSubview(image)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(status)
        stackView.addArrangedSubview(origin)
        stackView.addArrangedSubview(species)
        stackView.addArrangedSubview(lastPlace)
        stackView.addArrangedSubview(gender)
        stackView.addArrangedSubview(clearView)
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            image.topAnchor.constraint(equalTo: scrollView.topAnchor),
            image.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            image.widthAnchor.constraint(equalTo: view.widthAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }
    
    func configureViews() {
        image.loadImage(with: viewModel.character?.image ?? "")
        name.text = viewModel.character?.name
        status.text = viewModel.character?.status
        origin.configure(info: "CharacterDetailOrigin".localized,
                         name: viewModel.character?.origin.name)
        species.configure(info: "CharacterDetailSpecies".localized,
                          name: viewModel.character?.species)
        lastPlace.configure(info: "CharacterDetailLastPlace".localized,
                            name: viewModel.character?.location.name)
        gender.configure(info: "CharacterDetailGender".localized,
                         name: viewModel.character?.gender)
    }
}

extension CharacterDetailViewController: LoaderCapable {}

extension CharacterDetailViewController: AlertCapable {}
