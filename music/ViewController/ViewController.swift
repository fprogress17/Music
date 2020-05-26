//
//  ViewController.swift
//  music
//
//  Created by Choonghun Lee on 5/9/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let kItemURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json"
    
    var items = [Item]();
    var tableView : UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        view.backgroundColor = .white
        
        configureTableView()
        
        getData()
    }
    
    
    
    func configureTableView(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
        
         
        tableView.register(BasicTableViewCell.self, forCellReuseIdentifier:"basicTableViewCell")
    }


}

extension ViewController{
    
     func getData() {
          
        let url = URL(string: kItemURL )!

        DataManager.shared.fetchItems(url: url) {[weak self] result in
            
            switch result {
                case .success(let items):
                    
                    print(items)
                
                    DispatchQueue.main.async {
            
                        self?.items = items;
                        self?.tableView.reloadData();
            
                    }
                
                case .failure:
                    print("FAILED")
            }
            

          
        }
        
    }
    
    
   
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell :BasicTableViewCell = tableView.dequeueReusableCell(withIdentifier: "basicTableViewCell") as? BasicTableViewCell else{ return BasicTableViewCell() }
        
        let  item = self.items[indexPath.row]
        
        if let defaultImg =  UIImage(named: "unloading"){
            cell.imageView?.image = defaultImg
        }
        
        if let urlStr = item.artworkUrl100,  let url = URL(string: urlStr)
        {
             
            DataManager.shared.fetchImage(with: url) {  response in

                           switch response {
                           case .success (let image) :


                               cell.imageView?.contentMode = .scaleAspectFit
                               cell.imageView?.image = image
                               cell.setNeedsLayout()

                                break;

                           case .failure( let e ) :
                               print(e)
                               break;
                           }
            
              }
        }
        
        if let name  = item.name {
            cell.albumNameLabel.text = name
        }
        
         if let artistName  = item.artistName {
            cell.artistNameLabel.text =  artistName;
        }
        
        return cell;
    
    }
    
}


extension ViewController: UITableViewDelegate{
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        tableView.deselectRow(at: indexPath, animated: false)
    
        let selectedItem = items[indexPath.row]
         
        let detailVC = DetailPageViewController()
        detailVC.item = selectedItem;
        
        self.navigationController?.pushViewController(detailVC, animated: true);
         
       }
    
}
