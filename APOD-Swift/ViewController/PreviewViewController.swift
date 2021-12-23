//
//  PreviewViewController.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 23/12/21.
//

import Foundation
import UIKit


class PreviewViewController: UIViewController {
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var downloadIndicator: UIStackView!
    var astronomyPicture: AstronomyPicture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = astronomyPicture {
            let placeholder = UIImage(named: "placeholder")
            imagePreview.imageFromUrl(url: item.thumbnail!, placeholder: placeholder!) {
                self.imageDownloadCompleted()

            }
            date.text = item.date!
            textDescription.text = item.textDescription!
            textTitle.text = item.title!
        }
        
        
        
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imageDownloadCompleted() {
        downloadIndicator.isHidden = true
    }
}
