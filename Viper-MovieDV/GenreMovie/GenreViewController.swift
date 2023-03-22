//
//  GenreViewController.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 22/03/23.
//

import UIKit

protocol GenreViewProtocol: AnyObject {
    func showGenre()
    func loading()
    func displayError()
}

class GenreViewController: UIViewController, GenreViewProtocol {
    
    @IBOutlet weak var genreTableView: UITableView!
    
    var presenter: GenrePresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }
    
    func initView() {
        title = "Genre"
        registerTableView()
        presenter.fetchGenre()
    }
    
    func registerTableView() {
        genreTableView.dataSource = self
        genreTableView.delegate = self
    }
    
    func showGenre() {
        genreTableView.reloadData()
    }
    
    func loading() {
        _ = UIAlertController()
    }
    
    func displayError() {
        //
    }
}


extension GenreViewController : UITableViewDelegate {
    
}

extension GenreViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
