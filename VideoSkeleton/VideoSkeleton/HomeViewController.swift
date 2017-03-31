//
//  HomeViewController.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-03-26.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var carousel : UICollectionView!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var featuredCarouselViewHeight:NSLayoutConstraint!
    
    var carouselMovie = [Movie]()
    var featuredList = [MovieCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let collectionViewNib = UINib(nibName: "MovieCarouselCell", bundle: nil)
        self.carousel.register(collectionViewNib, forCellWithReuseIdentifier: "MovieCarouselCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setUpModel()
    }
    
    //Will be replaced by a nw call
    func setUpModel() {
        
        let firstMovie = Movie(name: "Maaveeran Kittu",url: "https://einthusan.tv/movie/watch/xVWB/?lang=tamil",wiki: "https://en.wikipedia.org/wiki/Maaveeran_Kittu",icon: "https://s3.amazonaws.com/einthusanthunderbolt/moviecovers/xVWB-66fe.jpg",trailer: "https://www.youtube.com/watch?v=C76JaARr6Xg",language: Language.Tamil,hd: false,pg13: false,ultraHD: false,sub: false)
        
        firstMovie.duration = "2H 30M"
        firstMovie.releaseYear = 2016
        firstMovie.uploadedDate = NSDate()
        
        self.carouselMovie.append(firstMovie)
        
        let secondMovie = Movie(name: "Maaveeran Kittu",url: "https://einthusan.tv/movie/watch/xVWB/?lang=tamil",wiki: "https://en.wikipedia.org/wiki/Maaveeran_Kittu",icon: "https://s3.amazonaws.com/einthusanthunderbolt/moviecovers/xVWB-66fe.jpg",trailer: "https://www.youtube.com/watch?v=C76JaARr6Xg",language: Language.Tamil,hd: true,pg13: true,ultraHD: true,sub: true)

        secondMovie.duration = "3H 30M"
        secondMovie.releaseYear = 2015
        secondMovie.uploadedDate = NSDate()
        
        self.carouselMovie.append(secondMovie)

        self.carousel.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.featuredList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // MARK: - UITableViewDelegate

    // MARK: - CollectionViewDelegate

    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.carouselMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCarouselCell", for: indexPath) as! MovieCarouselCell
        cell.populateCell(movie: self.carouselMovie[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width:collectionView.frame.size.width, height:collectionView.frame.size.height)
    }
}
