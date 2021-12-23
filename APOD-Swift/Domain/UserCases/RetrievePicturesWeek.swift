//
//  RetrievePicturesWeek.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 22/12/21.
//

import Foundation

class RetrievePicturesWeek {
    
    static let shared = RetrievePicturesWeek()
    var delegate: APODServiceDelegate?
    
    private init() {}
    
    func getPictureFrom(startDate: String, endDate: String,
                        onSuccess:@escaping (Array<AstronomyPicture>) -> (), onFailure:@escaping (NSError) -> ()) {
        self.delegate?.getPicturesFrom(startDate: startDate, endDate: endDate, onSuccess: { data in
            onSuccess(data)
        }, onFailure: { error in
            onFailure(error)
        })
    }
    

}
