//
//  Task.swift
//  NestedTask
//
//  Created by Егор Кожемин on 29.12.2021.
//

class Task: TaskProtocol {
    var name: String
    var tasks: [TaskProtocol] = []

    init(_ name: String) {
        self.name = name
    }

    func countSubTask() -> Int {
        tasks.count
    }

    func description() -> String {
        let cn = countSubTask() + tasks.compactMap { $0.countSubTask() }.reduce(0, +)
        return "\(cn)"
    }
}
