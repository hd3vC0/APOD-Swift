//
//  AlamoFireHttpManager.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 22/12/21.
//

import Foundation
import Alamofire

class AlamoFireHttpManager: HttpRequestManagerDelegate {    
    
    func makeRequest(url: String, method: String, params: Dictionary<String, Any>, onSuccess:@escaping (Any) -> (), onFailure:@escaping (NSError) -> ()) {
        
        let parameters = params as Parameters
        let request = AF.request(url, method: HTTPMethod(rawValue: method), parameters: parameters, encoding: URLEncoding.queryString, headers: nil, interceptor: nil, requestModifier: nil)
        
        request.response { data in
            if let error = data.error {
                onFailure(error as NSError)
            }
            else{
                onSuccess(data.data!)
            }
        }
    }
    
    
}
