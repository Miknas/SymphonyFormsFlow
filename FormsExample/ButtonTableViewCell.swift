//
//  ButtonTableViewCell.swift
//  FormsExample
//
//  Created by Namik Catibusic on 04/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
    func sendAction()
}

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var sendButton: UIButton!
    
    weak var delegate: ButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(for themeColor: UIColor) {
        sendButton.setTitleColor(themeColor, for: .normal)
        
    }
    
    @IBAction func sendPressed(_ sender: Any) {
        delegate?.sendAction()
    }
    
}
