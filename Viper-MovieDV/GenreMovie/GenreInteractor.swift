//
//  GenreInteractor.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import Foundation

protocol GenreInteractorProtocol: AnyObject {
    func fetchData()
    func pushToList(at indexPath: IndexPath)
}

class GenreInteractor: GenreInteractorProtocol {
    fileprivate var genres : [Genre] = []
    
    weak var presenter: GenrePresenterOutput!
    
    private let service = NetworkDataFetcher(service: NetworkService())
    
    func fetchData() {
        print("fetch data")
//        DispatchQueue .main.async {
            self.service.getGenre(endpoint: .getGenre) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let genres):
                    self.genres = genres
                    self.presenter.presentGenre(item: genres)
                case .failure(let error):
                    print("\(error.errorDescription)")
                }
            }
//        }
    }
    
    func pushToList(at indexPath: IndexPath) {
        //
    }
}

extension GenreInteractor   {
}
