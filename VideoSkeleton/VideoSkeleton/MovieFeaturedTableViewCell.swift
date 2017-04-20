//
//  MovieFeaturedTableViewCell.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-04-01.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import UIKit

class MovieFeaturedTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var cellHeaderLabel : UILabel!
    @IBOutlet weak var viewMorebutton : UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
