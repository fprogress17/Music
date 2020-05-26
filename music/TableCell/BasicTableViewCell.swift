//
//  BasicTableViewCell.swift
//  music
//
//  Created by Choonghun Lee on 5/9/20.
//  Copyright © 2020 Choonghun Lee. All rights reserved.
//

import UIKit

class BasicTableViewCell: UITableViewCell {

    let albumNameLabel = UILabel()
    let artistNameLabel = UILabel()
    let thumbnailImageView =  UIImageView()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style , reuseIdentifier: reuseIdentifier  )
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(){
        
        /// image
        let imageView = thumbnailImageView
        
        imageView.translatesAutoresizingMaskIntoConstraints = false;
       
        contentView.addSubview(imageView);
        
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true;
        
        contentView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -20).isActive = true;
        contentView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: -10).isActive = true;
        contentView.bottomAnchor .constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true;
        
        
        // label
        albumNameLabel.text = "album name"
        artistNameLabel.text = "artist name"
        
        // stackview
        let vStackView = UIStackView(arrangedSubviews: [albumNameLabel,artistNameLabel])
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        contentView.addSubview(vStackView);
        
        imageView.trailingAnchor.constraint(equalTo: vStackView.leadingAnchor, constant: -30).isActive = true;
        contentView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor, constant: 10).isActive = true;
        contentView.topAnchor.constraint(equalTo: vStackView.topAnchor, constant: -10).isActive = true;
        contentView.bottomAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 10).isActive = true;
        
        
    }
}
