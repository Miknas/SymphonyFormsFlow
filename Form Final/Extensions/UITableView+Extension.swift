//
//  UITableView+Extension.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func addFormItem(for type: CellType) {
        switch type {
        case .text, .secure: self.register(FormTextTableViewCell.nib(), forCellReuseIdentifier: FormTextTableViewCell.getReuseIdentifier())
        case .twoTextField: self.register(FormTwoTextFieldsTableViewCell.nib(), forCellReuseIdentifier: FormTwoTextFieldsTableViewCell.getReuseIdentifier())
        case .date: self.register(FormDateTableViewCell.nib(), forCellReuseIdentifier: FormDateTableViewCell.getReuseIdentifier())
        case .button: self.register(FormButtonTableViewCell.nib(), forCellReuseIdentifier: FormButtonTableViewCell.getReuseIdentifier())
        case .unknown: print("")
        }
    }
    
    func getFormCell(for model: FormFinalItem, indexPath: IndexPath, themeColor: UIColor, delegate: UIViewController) -> FormBaseTableViewCell {
        var cell = FormBaseTableViewCell()
        switch model.cellType {
        case .text, .secure:
            cell = self.dequeueReusableCell(withIdentifier: FormTextTableViewCell.getReuseIdentifier(), for: indexPath) as! FormTextTableViewCell
        case .twoTextField:
            cell = self.dequeueReusableCell(withIdentifier: FormTwoTextFieldsTableViewCell.getReuseIdentifier(), for: indexPath) as! FormTwoTextFieldsTableViewCell
        case .date:
            cell = self.dequeueReusableCell(withIdentifier: FormDateTableViewCell.getReuseIdentifier(), for: indexPath) as! FormDateTableViewCell
            if let delegate = delegate as? FormDateTableViewCellDelegate, let cell = cell as? FormDateTableViewCell {
                cell.delegate = delegate
            }
        case .button:
            cell = self.dequeueReusableCell(withIdentifier: FormButtonTableViewCell.getReuseIdentifier(), for: indexPath) as! FormButtonTableViewCell
            if let delegate = delegate as? FormButtonTableViewCellDelegate, let cell = cell as? FormButtonTableViewCell {
                cell.delegate = delegate
            }
        case .unknown: print("Error")
        }
        
        cell.setupCell(for: model, themeColor: themeColor)
        return cell
    }
}
