//
//  LoginLoginPresenter.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

class LoginPresenter: LoginModuleInput{

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!

    func viewIsReady() {
        
    }
}

extension LoginPresenter : LoginViewOutput {
    func verifyCreds(username: String, password: String) {
        print("LoginPresenter -> verifyCreds")
        self.interactor.checkCredentials(hostname: "xmpp.jp", userJIDString: "\(username)@xmpp.jp", password: password)
    }
}

extension LoginPresenter : LoginInteractorOutput {
    func loginVerified(success: Bool, error: String?) {
        print("LoginPresenter -> loginVerfied")
        if success {
            self.view.loginSuccess()
        } else {
            self.view.loginFailed(errorTitle: "Error", errorMessage: "Something went wrong")
        }
        
    }
}
