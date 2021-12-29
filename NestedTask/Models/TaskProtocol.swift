//
//  TaskProtocol.swift
//  NestedTask
//
//  Created by Егор Кожемин on 29.12.2021.
//

protocol TaskProtocol {
    var name: String { get set }
    func countSubTask() -> Int
    func description() -> String
}
