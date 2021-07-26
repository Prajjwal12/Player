//
//  Helper.swift
//  Player
//
//  Created by Kumar Prajjwal on 26/07/21.
//

import  UIKit

struct Helper {
    func getBoldAndNonBoldString(bold : String, nonbold: String, boldSize: CGFloat, nonBoldSize: CGFloat) -> NSMutableAttributedString{
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: boldSize, weight: UIFont.Weight.bold)
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: boldSize, weight: UIFont.Weight.regular)
        ]
        let boldText = NSAttributedString(string: bold, attributes: boldAttribute)
        let regularText = NSAttributedString(string: " "+nonbold, attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        return newString
        
    }
    func openUrl(_ urlString:String) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
}
