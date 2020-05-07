//
//  DateTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

protocol DateTableViewCellDelegate: class {
    func openDatePicker(for model: FormV2Item)
}

class DateTableViewCell: UITableViewCell {
    @IBOutlet weak var selectDate: UILabel!
    
    weak var delegate: DateTableViewCellDelegate?
    var model: FormV2Item!

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
    
    func setupCell(for model: FormV2Item){
        self.model = model
        if model.value == "" {
            selectDate.text = model.placeholder
        }
        else {
            selectDate.text = model.value
        }
    }
    
}
