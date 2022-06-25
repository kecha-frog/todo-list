//
//  TodoListTableViewCell.swift
//  todo list
//
//  Created by Ke4a on 24.06.2022.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {
    // MARK: - Visual Components

    private let todoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    // MARK: - Static Properties

    static var identifier = "TodoListTableViewCell"
    
    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(_ text: String){
        todoLabel.text = text
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubview(todoLabel)
        NSLayoutConstraint.activate([
            todoLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            todoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            todoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            todoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
