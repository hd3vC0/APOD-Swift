//
//  APODServiceDelegate.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 22/12/21.
//

import Foundation

protocol APODServiceDelegate{
    func getPicturesFrom(startDate: String, endDate: String,
                         onSuccess:@escaping (Array<AstronomyPicture>) -> (), onFailure:@escaping (NSError) -> ())
    
    func getPictureOfDay(day: String, onSuccess:@escaping (AstronomyPicture) -> (),
                         onFailure:@escaping (NSError) -> ())
}
