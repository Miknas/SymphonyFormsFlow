//
//  UIView+Extension.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    static func loadFromNib<T: UIView>() -> T {
        if let viewFromNib = Bundle.main.loadNibNamed("\(self)",
                                                      owner: self,
                                                      options: nil)?.first as? T {
            return viewFromNib
        }
        fatalError("Nib with name \(self) doesn't exist")
    }
}

extension UITableViewCell {
    static func getReuseIdentifier() -> String {
        return "\(self)"
    }
}
