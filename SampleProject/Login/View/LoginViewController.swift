//
//  LoginLoginViewController.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var output: LoginViewOutput!
    

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: LoginViewInput
    func setupInitialState() {
    }
    
    @IBAction func btnActions(_ sender: UIButton) {
        print("Login Button Pressed")
        self.output.verifyCreds(username: self.usernameTF.text ?? "", password: self.passwordTF.text ?? "")
    }
}

extension LoginViewController : LoginViewInput {
    func loginSuccess() {
        print("Login Success")
    }
    
    func loginFailed(errorTitle: String, errorMessage: String) {
        print("Login Failed")
    }
}
