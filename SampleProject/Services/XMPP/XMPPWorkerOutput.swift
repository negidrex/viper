//
//  XMPPWorkerOutput.swift
//  SampleProject
//
//  Created by IOSDev on 11/09/2019.
//  Copyright © 2019 IOSDev. All rights reserved.
//

import Foundation


protocol XMPPWorkerOutput : class {
    func authenticated(success: Bool, error: String?)
}
