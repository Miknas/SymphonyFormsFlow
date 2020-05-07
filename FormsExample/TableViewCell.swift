//
//  TableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate: class {
    // also can send indexPath
    func valueChanged(for title: String, value: String)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemHolder: UIView!
    @IBOutlet weak var itemTitle: UILabel!
    
    weak var delegate: TableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        itemHolder.layer.borderWidth = 1
        itemTextField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(for title: String, value: String, placeholder: String, themeColor: UIColor, isSecure: Bool = false){
        itemTitle.text = title
        itemTextField.text = value
        itemTextField.isSecureTextEntry = isSecure
        itemTextField.placeholder = placeholder
        itemHolder.layer.borderColor = themeColor.cgColor
    }
}

extension TableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.valueChanged(for: itemTitle.text!, value: textField.text!)
    }
}
