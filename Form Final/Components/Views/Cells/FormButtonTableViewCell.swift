//
//  FormButtonTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

protocol FormButtonTableViewCellDelegate: FormBaseTableViewCellDelegate {
    func sendAction(for model: FormFinalItem)
}

class FormButtonTableViewCell: FormBaseTableViewCell {
    @IBOutlet weak var actionButton: UIButton!
    weak var delegate: FormButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setupCell(for model: FormFinalItem, themeColor: UIColor) {
        super.setupCell(for: model, themeColor: themeColor)
        actionButton.setTitle(model.title, for: .normal)
        actionButton.setTitleColor(themeColor, for: .normal)
        
    }
    
    @IBAction func actionSelected(_ sender: Any) {
        delegate?.sendAction(for: model)
    }
}
