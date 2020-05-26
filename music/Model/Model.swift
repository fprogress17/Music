//
//  Model.swift
//  music
//
//  Created by Choonghun Lee on 5/9/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import Foundation
import UIKit


struct JSON : Codable{
    var feed  : Feed;
}

struct Feed : Codable{
    var title : String
    var id : String
    
    var author : Author
    
    var links : [Link]
    
    var copyright : String
    var country : String
    var icon : String
    var updated : String
    
    var results : [Item]
    
}

struct Link   : Codable{
    var self1 : String?
    var alternate : String? 
    
    enum CodingKeys: String, CodingKey {
        case self1 = "self"
        case alternate = "alternate"
         
    }
    
}
 
struct Links1 : Codable{

    var alternate : String
}
struct Author : Codable{
    var name : String
    var uri : String
    
}


struct Item : Codable{
    var      artistName : String?
    var      id : String?
    var      releaseDate : String?
    var      name : String?
    var      kind : String?
    var      copyright : String?
    var      artistId : String?
    var      cocntentAdvisoryRating : String?
    
    var      artistUrl : String?
    var      artworkUrl100 : String?
    var      genres : [Genre]
    var      url : String?
}

 struct Genre : Codable{
    var genreId : String?
    var name :  String?
    var url : String?
}


