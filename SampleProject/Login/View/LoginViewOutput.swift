//
//  LoginLoginViewOutput.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

protocol LoginViewOutput {

    /**
        @author Drexler Altarejos
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func verifyCreds(username: String, password: String)
}
