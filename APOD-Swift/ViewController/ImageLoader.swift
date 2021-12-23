//
//  ImageLoader.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 23/12/21.
//

import Foundation
import UIKit
import Alamofire

extension UIImageView {
    public func imageFromUrl(url: String, placeholder: UIImage, success:@escaping () -> ()){
        self.image = placeholder
        AF.request(url, method: .get).response { (response: AFDataResponse<Data?>) in
            if let data = response.data {
                self.image = UIImage(data: data)
                success()
            }
        }
    }
}
