//
//  LoginLoginInteractorInput.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

import Foundation

protocol LoginInteractorInput {
    func checkCredentials(username: String, password: String)
}
