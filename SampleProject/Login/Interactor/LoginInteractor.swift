//
//  LoginLoginInteractor.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

class LoginInteractor {
    
    weak var output: LoginInteractorOutput!
    var isAuthenticated: Bool = false
    var xmppController : XMPPWorker?
}


extension LoginInteractor : LoginInteractorInput {

    
    func checkCredentials(username: String, password: String) {
        print("LoginInteractor -> checkCredentials")
        
        if username == "admin" && password == "admin" {
            self.output.loginVerified(success: true, error: nil)
        } else {
            self.output.loginVerified(success: false, error: "Something")
        }
    }
    
    func checkCredentials(hostname: String, userJIDString: String, password: String) {
        print("LoginInteractor -> checkCreds")
        
        try! self.xmppController?.connect(userJIDString: userJIDString, password: password)
        
    }
}

extension LoginInteractor : XMPPWorkerOutput {
    func authenticated(success: Bool, error: String?) {
        print("LoginInteractor -> authenticated")
    }
}
