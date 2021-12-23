//
//  HttpRequestManagerDelegate.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 22/12/21.
//

import Foundation

protocol HttpRequestManagerDelegate {
    func makeRequest(url: String, method: String, params: Dictionary<String, Any>, onSuccess:@escaping (Any) -> (), onFailure:@escaping (NSError) -> ())
}
