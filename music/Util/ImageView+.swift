//
//  ImageView+.swift
//  music
//
//  Created by Choonghun Lee on 5/12/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
    func setImageFromUrl(imageURLStr :String) {
       URLSession.shared.dataTask( with: NSURL(string:imageURLStr)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.image = UIImage(data: data)
             }
          }
       }).resume()
    }
    
}

