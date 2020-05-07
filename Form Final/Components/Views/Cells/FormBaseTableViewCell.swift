//
//  FormBaseTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

@objc protocol FormBaseTableViewCellDelegate: class {
    @objc optional func valueChanged(for model: FormFinalItem, value: String)
}

class FormBaseTableViewCell: UITableViewCell {

    var model: FormFinalItem!
    var themeColor: UIColor = .clear
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(for model: FormFinalItem, themeColor: UIColor){
        self.model = model
        self.themeColor = themeColor
    }
}
