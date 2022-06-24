//
//  TodoListController.swift
//  todo list
//
//  Created by Ke4a on 24.06.2022.
//

import UIKit

class TodoListController: UIViewController {
    // MARK: - Visual Components
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()


    // MARK: - Computed Properties

    private var data: [Todo] {
        return todo?.list ?? []
    }

    // MARK: - Public Properties

    var update:(()-> Void)?

    // MARK: - Private Properties

    private var todo: Todo?

    // MARK: - Initialization

    init(_ subTodo: Todo ) {
        super.init(nibName: nil, bundle: nil)
        self.todo = subTodo
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addNavigationBarButton()

        tableView.register(TodoListTableViewCell.self, forCellReuseIdentifier: TodoListTableViewCell.identifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        update?()
    }

    // MARK: - Private Methods

    private func setupUI(){
        title = todo?.task
        view.backgroundColor = .white

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    private func addNavigationBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addAction))
    }

    // MARK: - Actions

    @objc private func addAction(){
        let alert = UIAlertController(title: "Введите задачу", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Задача"
        }

        let action = UIAlertAction(title: "OK", style: .default) { [weak alert] (_) in
            guard let text = alert?.textFields?.first?.text else { return }

            if text.isEmpty {
                guard let alert = alert else { return }
                alert.message = "Вы не ввели задачу"
                self.present(alert, animated: true, completion: nil)
            } else {
                self.todo?.addTodo(text)
                self.tableView.insertRows(at: [IndexPath(row: self.data.count - 1, section: 0)], with: .automatic)
            }
        }
        alert.addAction(action)

        self.present(alert, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension TodoListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subTodo = data[indexPath.row]

        let vc = TodoListController(subTodo)
        vc.update = { [weak self] in
            self?.tableView.reloadData()
        }

        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension TodoListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let text = data[indexPath.row].description

        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoListTableViewCell.identifier, for: indexPath) as? TodoListTableViewCell else { return UITableViewCell() }
        cell.configure(text)
        return cell
    }
}
