//
//  SubTodo.swift
//  todo list
//
//  Created by Ke4a on 24.06.2022.
//

import UIKit

protocol Todo {
    var description: String { get }
    var task: String { get }
    var list: [Todo] { get }
    func addTodo(_ task: String)
}

class SubTodo: Todo {
    // MARK: - Computed Properties

    var description: String {
        return list.isEmpty ? "\(task)" : "\(task) [ \(list.count) ]"
    }

    // MARK: - Private Properties

    private(set) var task: String
    private(set) var list: [Todo] = []

    // MARK: - Initialization

    init (_ task:String){
        self.task = task
    }

    // MARK: - Public Methods
    
    func addTodo(_ task: String) {
        let todo = SubTodo(task)
        list.append(todo)
    }
}
