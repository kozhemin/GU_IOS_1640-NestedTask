//
//  ViewController.swift
//  NestedTask
//
//  Created by Егор Кожемин on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    private var task = Task("root")

    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_: Bool) {
        tableView.reloadData()
    }

    public func setTask(_ t: Task?) {
        guard let task = t else { return }
        self.task = task
    }

    @IBAction func addNewTask(_: Any) {
        let newRowIndex = task.tasks.count

        task.tasks.append(Task("Task \(newRowIndex + 1)"))

        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]

        tableView.insertRows(at: indexPaths, with: .automatic)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = task.tasks[indexPath.row]

        let vc = storyboard!.instantiateViewController(withIdentifier: "NestedTaskViewController") as! Self
        vc.setTask(task as? Task)

        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        task.tasks.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataCell = task.tasks[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TaskCell")

        var conf = cell.defaultContentConfiguration()
        conf.text = "\(dataCell.name) (\(dataCell.description()))"
        conf.textProperties.color = .systemBlue

        conf.image = UIImage(systemName: "folder.fill")

        cell.contentConfiguration = conf

        return cell
    }
}
