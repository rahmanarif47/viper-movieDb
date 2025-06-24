//
//  GenreRouter.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import Foundation

protocol GenreRouterProtocol {
    init(viewController: GenreViewController)
    func pushToListMovie(by genre: String)
}

class GenreRouter: GenreRouterProtocol {
    let viewController: GenreViewController
    
    required init(viewController: GenreViewController) {
        self.viewController = viewController
    }
    
    func pushToListMovie(by genre: String) {
        let listMovieController = ListMovieViewController()
        
        
        viewController.navigationController?.pushViewController(listMovieController, animated: true)
    }
    
    
}
