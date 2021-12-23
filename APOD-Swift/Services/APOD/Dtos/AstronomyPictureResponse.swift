//
//  AstronomyPictureResponse.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 22/12/21.
//

import Foundation

struct AstronomyPictureResponse: Decodable {
    var title: String?
    var url: String?
    var hdurl: String?
    var explanation: String?
    var date: String?
    var copyright: String?
    var media_type: String?
    var service_version: String?
}
