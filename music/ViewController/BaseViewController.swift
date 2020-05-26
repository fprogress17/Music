//
//  BaseViewController.swift
//  music
//
//  Created by Choonghun Lee on 5/9/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {

    let spinner =  UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    let dimView =  UIView();
    
    override func viewDidLoad() {
        super.viewDidLoad()

       addDimView()
     
    }
    
    func addDimView(){
        
        
        dimView.translatesAutoresizingMaskIntoConstraints = false;
               
               view.addSubview(dimView);
               
               view.topAnchor.constraint(equalTo: dimView.topAnchor, constant: 0).isActive = true;
               view.leadingAnchor.constraint(equalTo: dimView.leadingAnchor, constant: 0).isActive = true;
               view.trailingAnchor.constraint(equalTo: dimView.trailingAnchor, constant: 0).isActive = true;
               view.bottomAnchor.constraint(equalTo: dimView.bottomAnchor, constant: 0).isActive = true;
               
               dimView.backgroundColor = UIColor(white: 0, alpha: 0.7)
  
                          spinner.translatesAutoresizingMaskIntoConstraints = false
                         
                          dimView.addSubview(spinner)

                          spinner.centerXAnchor.constraint(equalTo: dimView.centerXAnchor).isActive = true
                          spinner.centerYAnchor.constraint(equalTo: dimView.centerYAnchor).isActive = true
                  
           
               view.sendSubviewToBack(dimView)
        
    }
    
    func showSpinner(){
        
        view.bringSubviewToFront(dimView);
        
        spinner.startAnimating()
    }

    func hideSpinner(){
        
        view.sendSubviewToBack(dimView);
               
        spinner.stopAnimating()
        
    }
}
