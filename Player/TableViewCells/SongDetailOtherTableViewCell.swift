//
//  SongDetailOtherTableViewCell.swift
//  Player
//
//  Created by Kumar Prajjwal on 26/07/21.
//

import UIKit


class SongDetailOthersTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainView()
    }
    
    var collectionViewUrl : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = UIColor.red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var whereToGo : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var artistViewUrl : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = UIColor.red
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupMainView(){
        self.backgroundColor = UIColor.clear
        
        self.addSubview(whereToGo)
        
        whereToGo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        whereToGo.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        whereToGo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        whereToGo.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        self.addSubview(artistViewUrl)
        artistViewUrl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        artistViewUrl.topAnchor.constraint(equalTo: whereToGo.bottomAnchor, constant: 8).isActive = true
        artistViewUrl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        artistViewUrl.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        
        self.addSubview(collectionViewUrl)
        collectionViewUrl.topAnchor.constraint(equalTo: artistViewUrl.bottomAnchor, constant: 8).isActive = true
        collectionViewUrl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        collectionViewUrl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        collectionViewUrl.heightAnchor.constraint(lessThanOrEqualToConstant: 50).isActive = true
        
    }
    
    @objc func tap(gesture: UITapGestureRecognizer) {
        
    }
    
    @objc func tap1(gesture: UITapGestureRecognizer) {
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
