//
//  DetailPageViewController.swift
//  music
//
//  Created by Choonghun Lee on 5/12/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import UIKit

class DetailPageViewController: UIViewController {

    let arrayOfTitle = ["Album Name","Artist","Genre", "Release Date","CopyRight"]
    
    var item : Item? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

         view.backgroundColor = .white
        
        config()
        // Do any additional setup after loading the view.
    }

    func config(){
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        
        if let defaultImg =  UIImage(named: "unloading"){
            imageView.image = defaultImg
        }
        
        
        
        if let urlStr = item?.artworkUrl100,  let url = URL(string: urlStr)
        {

            DataManager.shared.fetchImage(with: url) {  response in

                           switch response {
                           case .success (let image) :


                                 imageView.contentMode = .scaleAspectFit
                                 imageView.image = image
                                 imageView.setNeedsLayout()

                                break;

                           case .failure( let e ) :
                               print(e)
                               break;
                           }
            
              }
        }
          
      
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        
        view.addSubview(imageView)
        
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: imageView.topAnchor,constant: -20).isActive = true;
        view.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -20).isActive = true;
        view.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive =
        true;
        
        
        
        
        let titleVStackView = UIStackView()
        titleVStackView.axis = .vertical
        titleVStackView.distribution = .equalCentering
        titleVStackView.spacing = 10
        
        
        titleVStackView.translatesAutoresizingMaskIntoConstraints = false;
 
        view.addSubview(titleVStackView)
 
       
                  
                  
        for title  in arrayOfTitle{

            let hStackView = UIStackView()
            hStackView.axis = .horizontal
            
            let titleLabel = UILabel()
            titleLabel.text = title

            hStackView.addArrangedSubview(titleLabel)

            let contentLabel = UILabel()
            contentLabel.numberOfLines = 0;
            
            switch title {
                case "Album Name":
                       contentLabel.text = item?.name;
                case "Artist":
                                      contentLabel.text = item?.artistName;
                case "Genre":
                    contentLabel.text = item?.genres[0].name;
                case "Release Date":
                                      contentLabel.text = item?.releaseDate;
                case "CopyRight":
                                      contentLabel.text = item?.copyright;
               default:
                break;
                
            }
            
         
            hStackView.addArrangedSubview(contentLabel)
            
            titleVStackView.addArrangedSubview(hStackView);

        }
        
        imageView.bottomAnchor.constraint(equalTo: titleVStackView.topAnchor, constant: -40).isActive = true;
        view.leadingAnchor.constraint(equalTo: titleVStackView.leadingAnchor, constant: -20).isActive = true;
        view.trailingAnchor.constraint(equalTo: titleVStackView.trailingAnchor, constant: 20).isActive =
        true;
        
        
       let button = UIButton()
       button.setTitle("Album Page", for: .normal)
        button.setTitleColor(.black,for : .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(openExt), for: .touchUpInside)
        
       button.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(button)
        view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true;
        view.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: -20).isActive = true;
        view.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: 20).isActive = true;
        
      
        
    }
    
    @objc func openExt(){
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }

        guard let urlString = self.item?.artistUrl, let eUrl = URL(string: urlString) else { return }

        windowScene.open(eUrl, options:nil , completionHandler:  nil  )
             
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
