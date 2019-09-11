//
//  LoginLoginConfigurator.swift
//  SampleProject
//
//  Created by Drexler Altarejos on 11/09/2019.
//  Copyright © 2019 Cross Bet. All rights reserved.
//

import UIKit

class LoginModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LoginViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LoginViewController) {

        let router = LoginRouter()

        let presenter = LoginPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LoginInteractor()
        interactor.output = presenter
        interactor.xmppController = XMPPWorker(hostname: "xmpp.jp")
        interactor.xmppController?.xmppWorkerOutput = interactor

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
