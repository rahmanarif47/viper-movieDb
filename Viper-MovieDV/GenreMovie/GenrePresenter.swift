//
//  GenrePresenter.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import Foundation

protocol GenrePresenterInput: AnyObject {
    func fetchGenre()
    func pushToList(at indexPath: IndexPath)
}

protocol GenrePresenterOutput: AnyObject {
    func presentGenre(item: [Genre])
}

class GenrePresenter: GenrePresenterInput {
    weak var view: GenreViewProtocol!
    var interactor: GenreInteractor!
    var router: GenreRouter!
    
    func fetchGenre() {
        interactor.fetchData()
    }
    
    func pushToList(at indexPath: IndexPath) {
        interactor.pushToList(at: indexPath)
    }
}

extension GenrePresenter: GenrePresenterOutput {
    func presentGenre(item: [Genre]) {
        view.showGenre()
    }
}
