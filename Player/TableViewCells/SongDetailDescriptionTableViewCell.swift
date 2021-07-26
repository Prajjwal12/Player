//
//  SongDetailDescriptionTableViewCell.swift
//  Player
//
//  Created by Kumar Prajjwal on 26/07/21.
//

import UIKit

class SongDetailDescriptionTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainView()
    }
    
    var albumDescription : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupMainView(){
        self.backgroundColor = UIColor.clear
        self.addSubview(albumDescription)
        albumDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        albumDescription.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        albumDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        albumDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

