//
//  ConfigUseCases.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 23/12/21.
//

import Foundation

class ConfigUseCases {
    
    private init(){}
    
    static func registerUseCases() {
        let apodService: APODServiceDelegate = APODService.shared
        
        RetrievePicturesWeek.shared.delegate = apodService
        RetrievePictureDay.shared.delegate = apodService
    }
}
