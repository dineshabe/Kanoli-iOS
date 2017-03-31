//
//  MovieCarouselCell.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-03-26.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCarouselCell: UICollectionViewCell {
    @IBOutlet weak var moviePoster : UIImageView!
    @IBOutlet weak var subtitleImage : UIImageView!
    @IBOutlet weak var pg13Image : UIImageView!
    @IBOutlet weak var hdImage : UIImageView!
    @IBOutlet weak var movieNameLabel : UILabel!
    @IBOutlet weak var languageLabel : UILabel!
    @IBOutlet weak var postedDateLabel : UILabel!
    

    func populateCell(movie: Movie) {
        self.moviePoster.sd_setImage(with: URL(string: movie.iconUrl)!, placeholderImage: nil)
        self.subtitleImage.isHidden = movie.hasSubtitle
        self.pg13Image.isHidden = movie.isPG13
        self.hdImage.isHidden = movie.isHD
        self.movieNameLabel.text = movie.name
        self.languageLabel.text = movie.language.rawValue
        self.postedDateLabel.text = movie.uploadedDate.description
    }
}
