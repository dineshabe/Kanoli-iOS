//
//  MovieListViewController.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-04-19.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import UIKit
import HMSegmentedControl

class MovieListViewController: UIViewController {

    @IBOutlet weak var toolBar : UIToolbar!
    @IBOutlet weak var collectionView : UICollectionView!
    var iPadSegmentControl: UISegmentedControl!
    var segmentControl: HMSegmentedControl!

    var movieList = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.customizeSegmentControl()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeFilter(sender: AnyObject) {
        
        var selectedSortIndex = 0
        if (UI_USER_INTERFACE_IDIOM() == .pad){
            selectedSortIndex = self.iPadSegmentControl.selectedSegmentIndex
        } else {
            selectedSortIndex = self.segmentControl.selectedSegmentIndex
        }
        print("Selected the sort order index \(selectedSortIndex)")
    }
    
    func customizeSegmentControl() {
        
        if (UI_USER_INTERFACE_IDIOM() == .pad){
            self.iPadSegmentControl = UISegmentedControl(items: ["Alphabet", "Year", "Rating"])
            self.iPadSegmentControl.frame = CGRect(x: 0, y: 0, width: 320, height: 29)
            self.iPadSegmentControl.addTarget(self, action:#selector(MovieListViewController.changeFilter(sender:)), for: .valueChanged)
        } else {
            
            let flexibleSpace: UIBarButtonItem = {UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)}()
            
            self.segmentControl = HMSegmentedControl(sectionTitles: ["Alphabet", "Year", "Rating"])
            self.segmentControl.frame = CGRect(x: self.toolBar.frame.origin.x, y: self.toolBar.frame.origin.y, width: self.toolBar.frame.width, height: self.toolBar.frame.height)
            self.segmentControl.autoresizingMask = .flexibleWidth
            self.segmentControl.selectionIndicatorLocation = .down
            self.segmentControl.selectionIndicatorHeight = 3.0
            self.segmentControl.selectionStyle = .fullWidthStripe
            self.segmentControl.segmentWidthStyle = .fixed
            self.segmentControl.selectionIndicatorEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            self.segmentControl.shouldAnimateUserSelection = true
            self.segmentControl.backgroundColor = UIColor.clear
            let barButtonItem = UIBarButtonItem.init(customView: self.segmentControl)
            
            let items = [flexibleSpace, barButtonItem, flexibleSpace]
            self.toolBar.items = items
            
            self.segmentControl.addTarget(self, action:#selector(MovieListViewController.changeFilter(sender:)), for: .valueChanged)
        }
    }
}
