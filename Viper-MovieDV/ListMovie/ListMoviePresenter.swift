//
//  ListMoviePresenter.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 25/03/23.
//

import Foundation

protocol ListMoviePresenterInput: AnyObject {
    func fetchListMovie(genre: Int, page: Int)
    func pushToDetail(at indexPath: IndexPath)
    func count() -> Int
    func showDataForCellRow(at indexPath: IndexPath) -> ResultMovieList
    func showLoading()
}

protocol ListMoviePresenterOutput: AnyObject {
    func presentListMovie(item: [ResultMovieList])
    func displayLoading()
}

class ListMoviePresenter : ListMoviePresenterInput {
    //    weak var view:
    var interactor: ListMovieInteractor!
    var router: ListMovieRouter!
        
    
    func fetchListMovie(genre: Int, page: Int) {
        interactor.fetchListMovie(genreId: genre, page: page)
    }
    
    func pushToDetail(at indexPath: IndexPath) {
        interactor.pushToDetail(at: indexPath)
    }
    
    func count() -> Int {
        interactor.numberOfItems()
    }
    
    func showDataForCellRow(at indexPath: IndexPath) -> ResultMovieList {
        interactor.showDataInCellForRow(at: indexPath)
    }
    
    func showLoading() {
        //
    }
}

extension ListMoviePresenter : ListMoviePresenterOutput {
    func presentListMovie(item: [ResultMovieList]) {
        //
    }
    
    func displayLoading() {
        //
    }
    
    
}
