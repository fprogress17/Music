//
//  DataManager.swift
//  music
//
//  Created by Choonghun Lee on 5/12/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case domainError
    case decodingError
}

final class DataManager {
 
     static let shared = DataManager( )
     

    func fetchItems(url: URL, completion: @escaping (Result<[Item],NetworkError>) -> Void) {
         
        URLSession.shared.dataTask(with: url) { data, response, error in
             
            guard let data = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                        completion(.failure(.domainError))
                }
                return
            }
            
            do {
                print(String(data: data, encoding: .utf8)!)
                let posts = try JSONDecoder().decode(JSON.self, from: data)
                let items = posts.feed.results
                completion(.success(items))
            } catch  let error { // 3
                print("Error creating current weather from JSON because:\(error.localizedDescription)");                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }

    func fetchImage (with url: URL , completion : @escaping  (Result<UIImage,Error>)->Void) {
           
        
        URLSession.shared.dataTask( with: url, completionHandler: {
           (data, response, error) -> Void in
           DispatchQueue.main.async {
              if let imageData = data,  let image = UIImage(data: imageData){
                 
                 completion(Result.success(image))
              
              }else{
               
                completion(Result.failure(NetworkError.domainError))
            }
           }
        }).resume()
        
    }

}
