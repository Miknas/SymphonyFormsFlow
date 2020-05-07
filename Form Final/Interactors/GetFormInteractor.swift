//
//  GetFormInteractor.swift
//  FormsExample
//
//  Created by Namik Catibusic on 05/05/2020.
//  Copyright © 2020 Namik Catibusic. All rights reserved.
//

import Foundation

@objc protocol GetFormInteractorOutput: class {
    @objc optional func getForm(model: GetFormResponse?, error: Error?)
}

class GetFormInteractor: GetFormServiceOutput {
    var service = GetFormService()
    weak var output: GetFormInteractorOutput?
    
    init() {
        service.output = self
    }
    
    func getForm(){
        service.getForm()
    }
    
    func getForm(object: [String : AnyObject]?, error: Error?) {
        if let err = error {
            output?.getForm?(model: nil, error: err)
        }
        else {
            let model = GetFormResponse(JSON: object!)
            output?.getForm?(model: model, error: nil)
        }
    }
}
