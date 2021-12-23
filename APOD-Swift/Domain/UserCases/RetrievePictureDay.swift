//
//  RetrievePictureDay.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 22/12/21.
//

import Foundation

class RetrievePictureDay {
    
    static let shared = RetrievePictureDay()
    var delegate: APODServiceDelegate?
    
    private init() {}
    
    func getPictureOfDay(day: String, onSuccess:@escaping (AstronomyPicture) -> (), onFailure:@escaping (NSError) -> ()){
        self.delegate?.getPictureOfDay(day: day, onSuccess: { item in
            onSuccess(item)
        }, onFailure: { error in
            onFailure(error)
        })
    }
    
}
