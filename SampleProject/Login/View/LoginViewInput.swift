//
//  LoginLoginViewInput.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

protocol LoginViewInput: class {

    /**
        @author Drexler Altarejos
        Setup initial state of the view
    */

    func setupInitialState()
    
    func loginSuccess()
    func loginFailed(errorTitle: String, errorMessage: String)
}
