//
//  DateTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

protocol FormDateTableViewCellDelegate: FormBaseTableViewCellDelegate {
    func openDatePicker(for model: FormFinalItem)
}

class FormDateTableViewCell: FormBaseTableViewCell {
    @IBOutlet weak var selectDate: UILabel!
    
    weak var delegate: FormDateTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.openDateTimePicker))
        selectDate.isUserInteractionEnabled = true
        selectDate.addGestureRecognizer(tapGesture)
        // Initialization code
    }
    
    @objc func openDateTimePicker() {
        delegate?.openDatePicker(for: model)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupCell(for model: FormFinalItem, themeColor: UIColor){
        super.setupCell(for: model, themeColor: themeColor)
        if model.value == "" {
            selectDate.text = model.placeholder
        }
        else {
            selectDate.text = model.value
        }
    }
    
}
