import UIKit

class SongTileTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainView()
    }
    
    var mainView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    var albumArt : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.red
        image.clipsToBounds = true
        return image
    }()
    
    var artistNameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var wrapperType : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    var albumName : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupMainView(){
        self.backgroundColor = UIColor.clear
        self.addSubview(mainView)
        mainView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        mainView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        mainView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        
        mainView.addSubview(albumArt)
        albumArt.leftAnchor.constraint(equalTo: mainView.leftAnchor, constant: 0).isActive = true
        albumArt.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0).isActive = true
        albumArt.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0).isActive = true
        albumArt.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        mainView.addSubview(wrapperType)
        wrapperType.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -4).isActive = true
        wrapperType.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -6).isActive = true
        wrapperType.heightAnchor.constraint(equalToConstant: 14).isActive = true
        wrapperType.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        mainView.addSubview(artistNameLabel)
        artistNameLabel.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 6).isActive = true
        artistNameLabel.rightAnchor.constraint(equalTo: wrapperType.leftAnchor, constant: -10).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -6).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true

        mainView.addSubview(albumName)
        albumName.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 6).isActive = true
        albumName.rightAnchor.constraint(equalTo: mainView.rightAnchor, constant: -6).isActive = true
        albumName.bottomAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: -6).isActive = true
        albumName.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 6).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
