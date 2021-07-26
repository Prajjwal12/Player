//
//  SongDetailExtraTableViewCell.swift
//  Player
//
//  Created by Kumar Prajjwal on 26/07/21.
//

import UIKit

class SongDetailExtraTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainView()
    }
    
    var wrapperType : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var primaryGenreName : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var artistName : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var collectionPrice : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var albumArt : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.red
        image.clipsToBounds = true
        return image
    }()
    
    func setupMainView(){
        self.backgroundColor = UIColor.clear
        
        self.addSubview(albumArt)
        albumArt.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        albumArt.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        albumArt.heightAnchor.constraint(equalToConstant: 100).isActive = true
        albumArt.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.addSubview(wrapperType)
        wrapperType.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 6).isActive = true
        wrapperType.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6).isActive = true
        wrapperType.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        
        
        self.addSubview(primaryGenreName)
        primaryGenreName.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 6).isActive = true
        primaryGenreName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6).isActive = true
        primaryGenreName.bottomAnchor.constraint(equalTo: wrapperType.topAnchor, constant: -6).isActive = true
        
        self.addSubview(collectionPrice)
        collectionPrice.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 6).isActive = true
        collectionPrice.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6).isActive = true
        collectionPrice.bottomAnchor.constraint(equalTo: primaryGenreName.topAnchor, constant: -6).isActive = true
        
        self.addSubview(artistName)
        artistName.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 6).isActive = true
        artistName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6).isActive = true
        artistName.bottomAnchor.constraint(equalTo: collectionPrice.topAnchor, constant: -6).isActive = true
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
