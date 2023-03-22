//
//  GenreBuilder.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import Foundation
import UIKit

protocol BuildModuleProtocol {
    static func build() -> UINavigationController
}

class GenreBuilder: BuildModuleProtocol {
    static func build() -> UINavigationController {
        let viewController =  GenreViewController()
        let presenter = GenrePresenter()
        let interactor = GenreInteractor()
        let router = GenreRouter(viewController: viewController)
        
        viewController.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = viewController
        
        interactor.presenter = presenter
        
        return UINavigationController(rootViewController: viewController)
    }
}
