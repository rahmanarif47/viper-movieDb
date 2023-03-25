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
        view.hideLoading()
    }
    
    func registerTableView() {
        genreTableView.dataSource = self
        genreTableView.delegate = self
        self.genreTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "GenreCell")
    }
    
    func showGenre() {
        genreTableView.reloadData()
    }
    
    func loading() {
        view.showLoading()
    }
    
    func displayError() {
//
    }
}


extension GenreViewController : UITableViewDelegate {
    
}

extension GenreViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.count()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenreCell", for: indexPath) as! TableViewCell
        
        cell.set(source: presenter.showDataforRowAt(at: indexPath))
        
        return cell
    }
    
    
}
