//
//  HomeViewController.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-03-26.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var carousel : UICollectionView!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var scrollView : UIScrollView!
    @IBOutlet weak var featuredCarouselViewHeight:NSLayoutConstraint!
    @IBOutlet weak var tableViewViewHeight:NSLayoutConstraint!

    var carouselMovie = [Movie]()
    var featuredList = [MovieCollection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let collectionViewNib = UINib(nibName: "MovieCarouselCell", bundle: nil)
        self.carousel.register(collectionViewNib, forCellWithReuseIdentifier: "MovieCarouselCell")
        
        let tableViewNib = UINib(nibName: "MovieFeaturedTableViewCell", bundle: nil)
        self.tableView.register(tableViewNib, forCellReuseIdentifier: "MovieFeaturedTableViewCell")
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
        
        let thirdMovie = Movie(name: "Maaveeran Kittu",url: "https://einthusan.tv/movie/watch/xVWB/?lang=tamil",wiki: "https://en.wikipedia.org/wiki/Maaveeran_Kittu",icon: "https://s3.amazonaws.com/einthusanthunderbolt/moviecovers/xVWB-66fe.jpg",trailer: "https://www.youtube.com/watch?v=C76JaARr6Xg",language: Language.Tamil,hd: true,pg13: true,ultraHD: true,sub: true)
        
        secondMovie.duration = "1H 30M"
        secondMovie.releaseYear = 2015
        secondMovie.uploadedDate = NSDate()
        
        self.carouselMovie.append(thirdMovie)
        
        let fourthMovie = Movie(name: "Maaveeran Kittu",url: "https://einthusan.tv/movie/watch/xVWB/?lang=tamil",wiki: "https://en.wikipedia.org/wiki/Maaveeran_Kittu",icon: "https://s3.amazonaws.com/einthusanthunderbolt/moviecovers/xVWB-66fe.jpg",trailer: "https://www.youtube.com/watch?v=C76JaARr6Xg",language: Language.Tamil,hd: true,pg13: true,ultraHD: true,sub: true)
        
        secondMovie.duration = "4H 30M"
        secondMovie.releaseYear = 2015
        secondMovie.uploadedDate = NSDate()
        
        self.carouselMovie.append(fourthMovie)
        
        let fiveMovie = Movie(name: "Maaveeran Kittu",url: "https://einthusan.tv/movie/watch/xVWB/?lang=tamil",wiki: "https://en.wikipedia.org/wiki/Maaveeran_Kittu",icon: "https://s3.amazonaws.com/einthusanthunderbolt/moviecovers/xVWB-66fe.jpg",trailer: "https://www.youtube.com/watch?v=C76JaARr6Xg",language: Language.Tamil,hd: true,pg13: true,ultraHD: true,sub: true)
        
        secondMovie.duration = "0H 30M"
        secondMovie.releaseYear = 2015
        secondMovie.uploadedDate = NSDate()
        
        self.carouselMovie.append(fiveMovie)
        
        self.featuredList.append(MovieCollection(name: "Staff Picks", list: self.carouselMovie))
        self.featuredList.append(MovieCollection(name: "Recently Added", list: self.carouselMovie))
        self.featuredList.append(MovieCollection(name: "Regional Hits", list: self.carouselMovie))
        self.featuredList.append(MovieCollection(name: "Coming Soon", list: self.carouselMovie))
        
        self.tableViewViewHeight.constant = self.tableView.rowHeight * CGFloat(self.featuredList.count)
        
        self.carousel.reloadData()
        self.tableView.reloadData()
        
        self.scrollView.layoutSubviews()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func WatchPressed () -> Void {
        print("WatchPressed")
    }
    
    func WikiPressed () -> Void {
        print("WikiPressed")
    }
    
    func TrailerPressed () -> Void {
        print("TrailerPressed")
    }
    
    func ViewMorePressed (sender: AnyObject) -> Void {
        print("ViewMorePressed for \(sender.tag)")
        self.navigationController?.pushViewController(UIStoryboard.MovieListViewController(), animated: true)
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.featuredList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieFeaturedTableViewCell", for: indexPath) as! MovieFeaturedTableViewCell
        
        cell.cellHeaderLabel.text = self.featuredList[indexPath.row].collectionName
        cell.viewMorebutton.tag = indexPath.row
        cell.viewMorebutton.addTarget(self, action: #selector(HomeViewController.ViewMorePressed(sender:)), for: UIControlEvents.touchUpInside)
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        
        let collectionViewNib = UINib(nibName: "FeaturedMovieCollectionCell", bundle: nil)
        cell.collectionView.register(collectionViewNib, forCellWithReuseIdentifier: "FeaturedMovieCollectionCell")
        
        return cell
    }
    // MARK: - UITableViewDelegate

    // MARK: - CollectionViewDelegate

    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.carousel == collectionView {
            return self.carouselMovie.count
        } else {
            let movieCollection  = self.featuredList[section]
            return movieCollection.movieList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if self.carousel == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCarouselCell", for: indexPath) as! MovieCarouselCell
            cell.populateCell(movie: self.carouselMovie[indexPath.row])
            
            cell.watchButton.addTarget(self, action: #selector(HomeViewController.WatchPressed), for: UIControlEvents.touchUpInside)
            cell.wikiButton.addTarget(self, action: #selector(HomeViewController.WikiPressed), for: UIControlEvents.touchUpInside)
            cell.trailerButton.addTarget(self, action: #selector(HomeViewController.TrailerPressed), for: UIControlEvents.touchUpInside)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedMovieCollectionCell", for: indexPath) as! FeaturedMovieCollectionCell
            let movieCollection  = self.featuredList[indexPath.section]
            cell.populateCell(movie: movieCollection.movieList[indexPath.row])
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize{
        if self.carousel == collectionView {
            return CGSize(width:collectionView.frame.size.width, height:collectionView.frame.size.height)
        } else {
            return CGSize(width: 100, height:150)
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
