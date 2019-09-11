//
//  LoginLoginInteractorOutput.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

import Foundation

protocol LoginInteractorOutput: class {
    func loginVerified(success: Bool, error: String?)
}
