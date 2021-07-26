//
//  ViewController.swift
//  Player
//
//  Created by Kumar Prajjwal on 26/07/21.
//

import UIKit
import Alamofire
import SDWebImage

class SongsListViewController: UIViewController {

    var songs : Songs!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var activityViewLabel: UILabel!
    let refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)]
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: myAttribute)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        activityView.startAnimating()
        
        
        self.tableView.register(SongTileTableViewCell.self, forCellReuseIdentifier: "SongTileTableViewCell")
        self.tableView.backgroundColor = UIColor(named: "list_background")
        self.tableView.separatorStyle = .none
        self.tableView.isHidden = true
        self.tableView.addSubview(refreshControl)
        
        getAllSongsList {
            if self.songs != nil {
                if self.songs.resultCount! > 0 {
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.activityView.stopAnimating()
                }
                else {
                    self.activityView.stopAnimating()
                    self.activityViewLabel.text = "No songs present."
                }
            }
            else {
                self.activityView.stopAnimating()
                self.activityViewLabel.text = "Error: Please try after sometime."
            }
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        getAllSongsList {
            if self.songs != nil {
                if self.songs.resultCount! > 0 {
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.refreshControl.endRefreshing()
                }
                else {
                    self.refreshControl.endRefreshing()
                    self.tableView.isHidden = true
                    self.activityViewLabel.text = "No songs present."
                }
            }
            else {
                self.refreshControl.endRefreshing()
                self.tableView.isHidden = true
                self.activityViewLabel.text = "Error: Please try after sometime."
            }
        }
    }
    
    
    func getAllSongsList(completed: @escaping () -> ()) {
        
        let jsonURL = Services().songsListUrl
        let url = URL(string: jsonURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let value =
            [
                [
                    ]
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: value)
        AF.request(request)
            .responseJSON { response in
                if let result = response.data {
                    do {
                        //print("response : ",response)
                        self.songs = try JSONDecoder().decode(Songs.self, from: result)
                        DispatchQueue.main.async {
                            completed()
                        }
                    }
                    catch {
                        print(error)
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completed()
                    }
                }
            }.resume()
    }

}

extension SongsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if songs != nil {
            if let c = songs.resultCount{ return c }
            else{ return 0 } }
        else{ return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongTileTableViewCell", for: indexPath) as! SongTileTableViewCell
        cell.selectionStyle = .none
        let songDetail = songs.results![indexPath.row]
        cell.albumArt.sd_setImage(with: URL(string: songDetail.artworkUrl100 ?? "")) { image, error, SDImageCacheType, url in
            if error == nil {
                cell.albumArt.image = image
                
            }
            else {
                cell.albumArt.image = UIImage(systemName: "music.quarternote.3")
            }
        }
        cell.wrapperType.text = songDetail.wrapperType ?? "None"
        cell.artistNameLabel.text = songDetail.artistName ?? "Not Available"
        cell.albumName.text = songDetail.collectionName ?? "\(songDetail.wrapperType ?? "Album") name not available."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
