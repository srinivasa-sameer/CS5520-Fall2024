//
//  ViewController.swift
//  App5
//
//  Created by Srinivasa Sameer Addepalli on 10/9/24.
//

import UIKit

class ViewController: UIViewController {
    let firstScreen = FirstScreenView()
    var expenses = [Expense]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Expense App"

        firstScreen.tableViewExpense.delegate = self
        firstScreen.tableViewExpense.dataSource = self

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped))
    }

    override func loadView() {
        view = firstScreen
    }

    @objc func onAddBarButtonTapped() {
        let addExpenseController = AddExpenseViewController()
        addExpenseController.delegate = self
        navigationController?.pushViewController(
            addExpenseController, animated: true)
    }

    func delegateOnAddExpense(expense: Expense) {
        expenses.append(expense)
        firstScreen.tableViewExpense.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return expenses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "expenses", for: indexPath)
            as! TableViewExpenseCell
        cell.labelTitle.text = expenses[indexPath.row].title
        if let uwAmount = expenses[indexPath.row].amount {
            cell.labelAmount.text = "Cost: $\(uwAmount)"
        }
        if let uwType = expenses[indexPath.row].type {
            cell.labelType.text = "Type: \(uwType)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print(self.expenses[indexPath.row])
        }

}
