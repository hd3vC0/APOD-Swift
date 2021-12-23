//
//  PictureCollectionViewCell.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 23/12/21.
//

import Foundation
import UIKit
import Alamofire

class PictureCollectionViewCell: UICollectionViewCell {
    var astronomyPicture: AstronomyPicture?
    @IBOutlet var image: UIImageView!
    @IBOutlet var date: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(astronomyPicture: AstronomyPicture){
        self.astronomyPicture = astronomyPicture
        self.date.text = astronomyPicture.date
        let placeholder = UIImage(named: "placeholder")
        image.imageFromUrl(url: astronomyPicture.thumbnail!, placeholder: placeholder!) {
            self.animate()
        }
    }
    
    func animate() {
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.fromValue = 0.0
        anim.toValue = 1.0
        anim.duration = 0.5
        anim.isRemovedOnCompletion = false
        
        image.layer.add(anim, forKey: "opacity")
    }
}
