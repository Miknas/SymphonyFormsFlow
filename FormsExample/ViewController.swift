//
//  ViewController.swift
//  FormsExample
//
//  Created by Namik Catibusic on 03/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameHolder: UIView!
    @IBOutlet weak var firstNameTitle: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameHolder: UIView!
    @IBOutlet weak var lastNameTitle: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailNameHolder: UIView!
    @IBOutlet weak var emailNameTitle: UILabel!
    @IBOutlet weak var emailNameTextField: UITextField!
    
    @IBOutlet weak var passwordNameHolder: UIView!
    @IBOutlet weak var passwordNameTitle: UILabel!
    @IBOutlet weak var passwordNameTextField: UITextField!
    
    @IBOutlet weak var scrollViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let holders = [firstNameHolder, lastNameHolder, emailNameHolder, passwordNameHolder]
        
        _ = holders.map({$0!.layer.borderWidth = 1})
        _ = holders.map({$0!.layer.borderColor = UIColor.red.cgColor})
        
        firstNameTextField.placeholder = "Enter first name"
        lastNameTextField.placeholder = "Enter last name"
        emailNameTextField.placeholder = "Enter email name"
        passwordNameTextField.placeholder = "Enter password name"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if scrollViewBottomConstraint != nil {
                scrollViewBottomConstraint.constant = keyboardSize.height
            }
            else {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if scrollViewBottomConstraint != nil {
                scrollViewBottomConstraint.constant = 0
            }
            else {
                if self.view.frame.origin.y != 0 {
                    self.view.frame.origin.y += keyboardSize.height
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if scrollView != nil {
            scrollView.contentSize = CGSize(width: 384, height: 500)
        }
    }

    @IBAction func sendForm(_ sender: Any) {
        view.endEditing(true)
        let fn = firstNameTextField.text!
        let ln = lastNameTextField.text!
        let email = emailNameTextField.text!
        let password = passwordNameTextField.text!
        
        viewModel.sendData(firstName: fn, lastName: ln, email: email, password: password)
    }
}

