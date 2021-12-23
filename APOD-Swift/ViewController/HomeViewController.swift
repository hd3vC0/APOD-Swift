//
//  HomeController.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 23/12/21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DatePickerDelegate {
    
    @IBOutlet weak var collectionViewController: UICollectionView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    var today: Date?
    var startDate: String?
    var endDate:String?
    var formatter: DateFormatter?
    var data: Array<AstronomyPicture>?
    
    func initialize() {
        formatter = DateFormatter()
        formatter?.dateFormat = "yyyy-MM-dd"
        today = Date()
        endDate = formatter?.string(from: today!)
        
        let calendar = Calendar.current
        let lastweek = calendar.date(byAdding: Calendar.Component.day, value: -7, to: today!)
        
        startDate = formatter?.string(from: lastweek!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let d = data {
            return d.count
        }
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! PictureCollectionViewCell
        
        let tmp = data![indexPath.row]
        item.setData(astronomyPicture: tmp)
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var itemXline: CGFloat = 2.0
        let width = UIScreen.main.bounds.width
        
        if width >= 768 {
            itemXline = 3.0
        }
        
        let cellWidth = floor(width/itemXline)
        return CGSize(width: cellWidth, height: cellWidth)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        collectionViewController.delegate = self
        collectionViewController.dataSource =  self
        
        RetrievePicturesWeek.shared.getPictureFrom(startDate: startDate!, endDate: endDate!) { response in
            self.data = response
            self.collectionViewController.reloadData()
            self.indicator.isHidden = true
        } onFailure: { error in
            print(error)
            self.indicator.isHidden = true
        }
        
        
        let nib = UINib(nibName: "PictureCollectionViewCell", bundle: nil)
        collectionViewController.register(nib, forCellWithReuseIdentifier: "CustomCell")
        
        self.title = "APOD"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showPreview(astronomyPictute: data![indexPath.row])
    }
    
    @IBAction func showPictureofDay(_ sender: Any) {
        
        let datepicker = DatePickerViewController(nibName: "DatePickerViewController", bundle: nil)
        datepicker.delegate = self
        datepicker.maximunDate = today!
        
        present(datepicker, animated: true, completion: nil)
    }
    
    func onDone(date: Date) {
        getPictureOfDay(day: date)
    }
    
    func getPictureOfDay(day: Date){
        RetrievePictureDay.shared.getPictureOfDay(day: formatter!.string(from: day)) { response in
            self.showPreview(astronomyPictute: response)
        } onFailure: { error in
            print(error)
        }
        
    }
    
    func showPreview(astronomyPictute: AstronomyPicture){
        let preview = PreviewViewController(nibName: "PreviewViewController", bundle: nil)
        preview.astronomyPicture = astronomyPictute
        
        present(preview, animated: true, completion: nil)
        
    }
}
