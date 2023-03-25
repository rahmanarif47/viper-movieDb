//
//  ListMovieInteractor.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 25/03/23.
//

import Foundation

protocol ListMovieInteractorProtocol: AnyObject {
    func fetchListMovie(genreId: Int, page: Int)
    func pushToDetail(at indexPath: IndexPath)
    func numberOfItems() -> Int
    func showLoading()
    func showDataInCellForRow(at indexPath : IndexPath) -> ResultMovieList
}

class ListMovieInteractor : ListMovieInteractorProtocol{
    fileprivate var listMovies: [ResultMovieList] = []
    
    weak var presenter : ListMoviePresenter!
    
    private let service = NetworkDataFetcher(service: NetworkService())
    
    
    func fetchListMovie(genreId: Int, page: Int) {
        self.service.getMovieList(endpoint: .getListMovieByGenre(genreId, page)) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movieList): self.listMovies = movieList
//                self.presenter.presentListMovie(item: movieList)
            case .failure(let error):
                print("\(error.errorDescription)")
            }
            
        }
    }
    
    func pushToDetail(at indexPath: IndexPath) {
        //
    }
    
    func numberOfItems() -> Int {
        return listMovies.count
    }
    
    func showLoading() {
        //
    }
    
    func showDataInCellForRow(at indexPath: IndexPath) -> ResultMovieList {
        return listMovies[indexPath.row]
    }
}
