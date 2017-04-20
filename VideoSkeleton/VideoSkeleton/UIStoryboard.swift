//
//  UIStoryboard.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-04-19.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func MovieListViewController() -> MovieListViewController {
        return UIStoryboard.LoadViewController(identifier: "MovieListViewController") as! MovieListViewController
    }
    
    static func LoadViewController(identifier: String, storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
