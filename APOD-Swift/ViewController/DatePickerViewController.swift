//
//  DatePickerViewController.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 23/12/21.
//

import Foundation
import UIKit
protocol DatePickerDelegate {
    func onDone(date: Date)
}
class DatePickerViewController: UIViewController{
    @IBOutlet weak var datePicker: UIDatePicker!
    var delegate: DatePickerDelegate?
    var minimunDate: Date?
    var maximunDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let min = minimunDate {
            datePicker.minimumDate = min
        }
        
        if let max = maximunDate {
            datePicker.maximumDate = max
        }
        
    }
    
    @IBAction func onDone(_ sender: Any) {
        if let tdelegate = delegate {
            tdelegate.onDone(date: datePicker.date)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
