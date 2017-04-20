//
//  MovieCollection.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-03-26.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import Foundation
class MovieCollection {
    var movieList = [Movie]()
    var collectionName = ""
    
    init(name: String, list: [Movie]) {
        self.collectionName = name
        self.movieList = list
    }
}
