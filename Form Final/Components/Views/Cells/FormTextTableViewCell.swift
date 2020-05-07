//
//  FormItemTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

class FormTextTableViewCell: FormBaseTableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemHolder: UIView!
    
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
    
    override func setupCell(for model: FormFinalItem, themeColor: UIColor){
        super.setupCell(for: model, themeColor: themeColor)
        self.model = model
        itemTitle.text = model.title
        itemTextField.text = model.value
        itemTextField.isSecureTextEntry = model.isSecure
        itemTextField.placeholder = model.placeholder
        itemHolder.layer.borderColor = themeColor.cgColor
    }
    
}

extension FormTextTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.model.value = textField.text!
    }
}
