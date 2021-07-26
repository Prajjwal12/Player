//
//  SongDetailViewController.swift
//  Player
//
//  Created by Kumar Prajjwal on 26/07/21.
//

import UIKit

class SongDetailViewController : UIViewController {
    
    var songDetails: SongsResult!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(SongDetailHeadingTableViewCell.self, forCellReuseIdentifier: "SongDetailHeadingTableViewCell")
        self.tableView.register(SongDetailExtraTableViewCell.self, forCellReuseIdentifier: "SongDetailExtraTableViewCell")
        self.tableView.register(SongDetailDescriptionTableViewCell.self, forCellReuseIdentifier: "SongDetailDescriptionTableViewCell")
        self.tableView.register(SongDetailOthersTableViewCell.self, forCellReuseIdentifier: "SongDetailOthersTableViewCell")
        self.tableView.backgroundColor = UIColor(named: "list_background2")
        self.tableView.separatorStyle = .none
        
        if songDetails != nil {
            self.copyrightLabel.text = songDetails.copyright
        }
    }
}


extension SongDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if songDetails != nil {
            return 4
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SongDetailHeadingTableViewCell", for: indexPath) as! SongDetailHeadingTableViewCell
            cell.selectionStyle = .none
            cell.albumName.text = songDetails.collectionName
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SongDetailExtraTableViewCell", for: indexPath) as! SongDetailExtraTableViewCell
            cell.selectionStyle = .none
            
            cell.wrapperType.attributedText = Helper().getBoldAndNonBoldString(bold: "Type: ", nonbold: songDetails.wrapperType ?? " Not Available", boldSize: 15, nonBoldSize: 15)
            
            cell.primaryGenreName.attributedText = Helper().getBoldAndNonBoldString(bold: "Genre: ", nonbold: songDetails.primaryGenreName ?? " Not Available", boldSize: 15, nonBoldSize: 15)
            
            if let price = songDetails.collectionPrice {
                cell.collectionPrice.attributedText = Helper().getBoldAndNonBoldString(bold: "Price: ", nonbold: "\(price)", boldSize: 15, nonBoldSize: 15)
            }
            else {
                cell.collectionPrice.attributedText = Helper().getBoldAndNonBoldString(bold: "Price: ", nonbold: "Not Available", boldSize: 15, nonBoldSize: 15)
            }
            
            cell.artistName.attributedText = Helper().getBoldAndNonBoldString(bold: "Name: ", nonbold: songDetails.artistName ?? " Not Available", boldSize: 15, nonBoldSize: 15)
            
            cell.albumArt.sd_setImage(with: URL(string: songDetails.artworkUrl100 ?? "")) { image, error, SDImageCacheType, url in
                if error == nil {
                    cell.albumArt.image = image
                    
                }
                else {
                    cell.albumArt.image = UIImage(systemName: "music.quarternote.3")
                }
            }
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SongDetailDescriptionTableViewCell", for: indexPath) as! SongDetailDescriptionTableViewCell
            cell.selectionStyle = .none
            cell.albumDescription.text = songDetails.description?.htmlToString
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SongDetailOthersTableViewCell", for: indexPath) as! SongDetailOthersTableViewCell
            cell.selectionStyle = .none
            cell.whereToGo.text = "Where to go from here?"
            cell.artistViewUrl.text =  songDetails.artistViewUrl
            cell.collectionViewUrl.text = songDetails.collectionViewUrl
            
            
            return cell
            
        }
    }
    
    @objc func gestureAction() {
            print("gesture action")
        }
    
    @objc func tapFunction(gesture: UITapGestureRecognizer) {
    print("hello")
            Helper().openUrl(songDetails.artistViewUrl!)
    }
    
    @objc func tap1(gesture: UITapGestureRecognizer) {
        print("jkbghcjkl")
            Helper().openUrl(songDetails.collectionViewUrl!)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        }
        else if indexPath.row == 1 {
            return 100
        }
        else if indexPath.row == 2{
            return UITableView.automaticDimension
        }
        else {
            return 130
        }
    }
}


extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}


@IBDesignable class LabelButton: UILabel {
    var onClick: () -> Void = {}
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onClick()
    }
}
