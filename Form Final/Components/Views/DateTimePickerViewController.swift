//
//  DateTimePickerViewController.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

protocol DateTimePickerViewControllerDelegate: class {
    func dateSelected(for model: FormFinalItem, value: String)
}

class DateTimePickerViewController: UIViewController {
    @IBOutlet weak var cancelHolder: UIView!
    
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DateTimePickerViewControllerDelegate?
    
    var model: FormFinalItem!
    var themeColor: UIColor = .clear
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelHolder.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cancel))
        cancelHolder.addGestureRecognizer(tapGesture)
        
        self.selectButton.setTitleColor(themeColor, for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @objc func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectDate(_ sender: Any) {
        let date = datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let value = formatter.string(from: date)
        
        delegate?.dateSelected(for: model, value: value)
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
