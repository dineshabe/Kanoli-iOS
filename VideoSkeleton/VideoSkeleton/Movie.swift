//
//  Movie.swift
//  VideoSkeleton
//
//  Created by Dinesh_Personal on 2017-03-26.
//  Copyright © 2017 Dinesh_Personal. All rights reserved.
//

import Foundation

enum Language : String {
    case Tamil = "Tamil"
    case Hindi = "Hindi"
    case Telugu = "Telugu"
    case Malayalam = "Malayalam"
    case Kannada = "Kannada"
    case Bengali = "Bengali"
    case Marathi = "Marathi"
    case Punjabi = "Punjabi"
    case None = ""

}

enum Role : String {
    case Director = "Director"
    case MusicDirector = "MusicDirector"
    case Lead = "Lead"
    case None = ""
}

class Actor {
    var name = ""
    var role : Role = .None
}

class Movie {
    var name = ""
    var videoUrl = ""
    var wikiUrl = ""
    var iconUrl = ""
    var trailerUrl = ""
    var duration = ""
    var language : Language = .None
    var isHD = false
    var isPG13 = false
    var isUltraHD = false
    var hasSubtitle = false
    var releaseYear = Int(exactly: 1990)
    var uploadedDate = NSDate()
    var castList = [Actor]()
    
    init(name: String, url: String = "", wiki: String = "", icon: String = "", trailer: String = "", language: Language = .Tamil, hd: Bool = true, pg13: Bool = true, ultraHD: Bool = true, sub: Bool = true){
        self.name = name
        self.videoUrl = url
        self.wikiUrl = wiki
        self.iconUrl = icon
        self.trailerUrl = trailer
        self.language = language
        self.isHD = hd
        self.isPG13 = pg13
        self.isUltraHD = ultraHD
        self.hasSubtitle = sub
    }
}
