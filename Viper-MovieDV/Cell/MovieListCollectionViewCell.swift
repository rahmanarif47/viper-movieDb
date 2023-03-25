//
//  MovieListCollectionViewCell.swift
//  Viper-MovieDV
//
//  Created by Arif Rahman Sidik on 25/03/23.
//

import UIKit

class MovieListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(item: ResultMovieList) {
        var baseImageUrl: String {
            return "https://image.tmdb.org/t/p/w500/"
        }
        
        titleLabel.text =  item.title
//        posterImageView.image = Image
    }
}
