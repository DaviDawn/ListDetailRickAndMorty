//
//  CharacterListViewController.swift
//  ListDetailRickAndMorty
//
//  Created by David Alba on 18/4/24.
//

import UIKit
import Combine

final class CharacterListViewController: UIViewController {
    private let viewModel: CharacterListViewModel
    private var cancellables: Set<AnyCancellable>
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CharacterListViewCell.self, forCellReuseIdentifier: CharacterListViewCell.id)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: CharacterListViewModel) {
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

private extension CharacterListViewController {
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
            case .loadList:
                self?.tableView.reloadData()
                self?.hideLoader()
            case .alertError:
                self?.hideLoader()
                self?.showAlert(title: "GenericErrorTitle".localized, info: "GenericErrorInformation".localized)
            }
        }.store(in: &cancellables)
    }
    
    func build() {
        title = "CharacterListNavigationTitle".localized
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        
        view.backgroundColor = .darkGray
        view.addSubview(tableView)
        view.sendSubviewToBack(tableView)
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
}

extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.list.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.list.characters[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterListViewCell.id,
                                                       for: indexPath) as? CharacterListViewCell
        else { return UITableViewCell() }
        
        cell.configure(imageURL: item.image, 
                       name: item.name,
                       status: item.status, 
                       species: item.species)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let count = viewModel.list.characters.count
        if indexPath.row == count - 1 {
            showLoader()
            viewModel.needMoreCharacters()
        }
    }
}

extension CharacterListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didTapCell(position: indexPath.row)
    }
}

extension CharacterListViewController: LoaderCapable {}

extension CharacterListViewController: AlertCapable {}
