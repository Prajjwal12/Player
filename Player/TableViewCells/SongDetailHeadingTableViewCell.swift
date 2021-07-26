//
//  SongDetailHeadingTableViewCell.swift
//  Player
//
//  Created by Kumar Prajjwal on 26/07/21.
//

import UIKit

class SongDetailHeadingTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainView()
    }
    
    var albumName : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupMainView(){
        self.backgroundColor = UIColor.clear
        self.addSubview(albumName)
        albumName.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        albumName.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        albumName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        albumName.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
