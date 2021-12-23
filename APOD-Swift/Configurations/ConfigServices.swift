//
//  ConfigServices.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 23/12/21.
//

import Foundation

class ConfigServices {
    
    private init(){}
    
    static func registerServices() {
        let manager = AlamoFireHttpManager()
        APODService.shared.manager = manager
    }
}
