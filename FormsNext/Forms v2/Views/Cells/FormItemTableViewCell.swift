//
//  FormItemTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

class FormItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemHolder: UIView!
    
    var model: FormV2Item!
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTextField.delegate = self
        itemHolder.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(for model: FormV2Item){
        self.model = model
        itemTitle.text = model.title
        itemTextField.text = model.value
        itemTextField.isSecureTextEntry = model.isSecure
        itemTextField.placeholder = model.placeholder
        itemHolder.layer.borderColor = model.themeColor.cgColor
    }
    
}

extension FormItemTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.model.value = textField.text!
    }
}
