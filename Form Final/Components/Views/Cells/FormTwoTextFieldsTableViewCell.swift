//
//  TwoTextFieldsTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

class FormTwoTextFieldsTableViewCell: FormBaseTableViewCell {
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var holderOne: UIView!
    @IBOutlet weak var holderTwo: UIView!
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        holderOne.layer.borderWidth = 1
        holderTwo.layer.borderWidth = 1
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupCell(for model: FormFinalItem, themeColor: UIColor){
        super.setupCell(for: model, themeColor: themeColor)
        itemTitle.text = model.title
        textFieldOne.text = model.value
        textFieldOne.isSecureTextEntry = model.isSecure
        textFieldOne.placeholder = model.placeholder
        holderOne.layer.borderColor = themeColor.cgColor
        
        textFieldTwo.text = model.value2
        textFieldTwo.isSecureTextEntry = model.isSecure2
        textFieldTwo.placeholder = model.placeholder2
        holderTwo.layer.borderColor = themeColor.cgColor
    }
    
}
