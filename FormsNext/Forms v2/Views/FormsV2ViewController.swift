//
//  FormsV2ViewController.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

class FormsV2ViewController: UIViewController {
    var viewModel: FormsV2ViewModel = FormsV2ViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        
        let button = UINib(nibName: "ButtonTableViewCell", bundle: nil)
        tableView.register(button, forCellReuseIdentifier: "ButtonTableViewCell")
        
        tableView.register(UINib(nibName: "FormItemTableViewCell", bundle: nil), forCellReuseIdentifier: "FormItemTableViewCell")
        tableView.register(UINib(nibName: "TwoTextFieldsTableViewCell", bundle: nil), forCellReuseIdentifier: "TwoTextFieldsTableViewCell")
        tableView.register(UINib(nibName: "DateTableViewCell", bundle: nil), forCellReuseIdentifier: "DateTableViewCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let _ = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

extension FormsV2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension FormsV2ViewController: ButtonTableViewCellDelegate {
    func sendAction() {
        view.endEditing(true)
        viewModel.sendData()
    }
}

extension FormsV2ViewController: TableViewCellDelegate {
    func valueChanged(for title: String, value: String) {
        if let item = viewModel.items.first(where: {$0.title == title}) {
            item.value = value
        }
    }
}

extension FormsV2ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == viewModel.items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell") as! ButtonTableViewCell
            cell.setupCell(for: .red)
            cell.delegate = self
            return cell
        }
        else {
            let item = viewModel.items[indexPath.row]
            if item.placeholder2 != "" {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TwoTextFieldsTableViewCell", for: indexPath) as! TwoTextFieldsTableViewCell
                cell.setupCell(for: item)
                return cell
            }
            else {
                if indexPath.row == 3 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DateTableViewCell", for: indexPath) as! DateTableViewCell
                    cell.setupCell(for: item)
                    cell.delegate = self
                    return cell
                }
                else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FormItemTableViewCell") as! FormItemTableViewCell
                    cell.setupCell(for: item)
                    return cell
                }
            }
        }
    }
}

extension FormsV2ViewController : DateTableViewCellDelegate {
    func openDatePicker(for model: FormV2Item) {
        // open date time picker
        // for sake of simplicity, just assign value
        model.value = "11.11.2020"
        self.tableView.reloadData()
    }
}
