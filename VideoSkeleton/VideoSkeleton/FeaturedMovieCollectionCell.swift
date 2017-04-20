//
//  FeaturedMovieCollectionCell.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-04-04.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import UIKit
import SDWebImage

class FeaturedMovieCollectionCell: UICollectionViewCell {
    @IBOutlet weak var moviePoster : UIImageView!
    @IBOutlet weak var nameLabel : UILabel!

    func populateCell(movie: Movie) {
        self.moviePoster.sd_setImage(with: URL(string: movie.iconUrl)!, placeholderImage: nil)
        self.nameLabel.text = movie.name
    }
}
