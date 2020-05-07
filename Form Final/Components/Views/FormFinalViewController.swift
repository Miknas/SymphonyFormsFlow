//
//  FormFinalViewController.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

class FormFinalViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: FormFinalViewModel = FormFinalViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getData()
        viewModel.output = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addFormItem(for: .button)
        tableView.addFormItem(for: .date)
        tableView.addFormItem(for: .text)
        tableView.addFormItem(for: .twoTextField)
        tableView.addFormItem(for: .secure)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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

extension FormFinalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
}

extension FormFinalViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.items[indexPath.row]
        let cell = tableView.getFormCell(for: item, indexPath: indexPath, themeColor: viewModel.themeColor, delegate: self)
        return cell
    }
}

extension FormFinalViewController: FormDateTableViewCellDelegate {
    func openDatePicker(for model: FormFinalItem) {
        let story = UIStoryboard(name: "FormFinal", bundle: nil)
        let viewController = story.instantiateViewController(withIdentifier: "DateTimePickerViewController") as! DateTimePickerViewController
        viewController.model = model
        viewController.delegate = self
        viewController.themeColor = viewModel.themeColor
        self.present(viewController, animated: true, completion: nil)
    }
}

extension FormFinalViewController: FormButtonTableViewCellDelegate {
    func sendAction(for model: FormFinalItem) {
        self.view.endEditing(true)
        if model.jsonKey == "send" {
            viewModel.sendData()
        }
        else if model.jsonKey == "clear" {
            viewModel.clearData()
            self.tableView.reloadData()
        }
    }
}

extension FormFinalViewController: DateTimePickerViewControllerDelegate {
    func dateSelected(for model: FormFinalItem, value: String) {
        if let item = viewModel.items.first(where: {$0.jsonKey == model.jsonKey}){
            item.value = value
        }
        self.tableView.reloadData()
    }
}


extension FormFinalViewController: FormFinalViewModelOutput {
    func refreshUI() {
        self.tableView.reloadData()
    }
}
