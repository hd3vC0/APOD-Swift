//
//  APODService.swift
//  APOD-Swift
//
//  Created by Humberto Monterrosa on 22/12/21.
//

import Foundation

class APODService: APODServiceDelegate {
    
    static let shared = APODService()
    var manager: HttpRequestManagerDelegate?
    
    private init(){}
    
    func getPicturesFrom(startDate: String, endDate: String, onSuccess:@escaping (Array<AstronomyPicture>) -> (), onFailure:@escaping (NSError) -> ()) {
        self.manager?.makeRequest(url: Constants.API_ENDPOINT,
                                  method: "GET",
                                  params: ["api_key": Constants.API_KEY, "start_date": startDate, "end_date": endDate],
                                  onSuccess: { result in
                                    do {                                        
                                        let jsonDecoder = JSONDecoder()
                                        let res = try jsonDecoder.decode(Array<AstronomyPictureResponse>.self, from: result as! Data)
                                        
                                        var list:Array<AstronomyPicture> = []
                                        
                                        for item in res {
                                            let temp = AstronomyPicture(title: item.title, thumbnail: item.url, picture: item.hdurl, textDescription: item.explanation, date: item.date, copyright: item.copyright)
                                            list.append(temp)
                                            
                                        }
                                        
                                        list = list.reversed()
                                        
                                        onSuccess(list)
                                    }
                                    catch {
                                        onFailure(NSError(domain: "Error", code: -1, userInfo: nil))
                                    }

                                    },
                                  onFailure: { error in
                                    onFailure(error)
                                })
    }
    
    func getPictureOfDay(day: String, onSuccess:@escaping (AstronomyPicture) -> (), onFailure:@escaping (NSError) -> ()) {
        
        self.manager?.makeRequest(url: Constants.API_ENDPOINT,
                                  method: "GET",
                                  params: ["api_key": Constants.API_KEY, "date": day],
                                  onSuccess: { result in
                                    do {
                                        let jsonDecoder = JSONDecoder()
                                        let item = try jsonDecoder.decode(AstronomyPictureResponse.self, from: result as! Data)
                                        
                                        let temp = AstronomyPicture(title: item.title, thumbnail: item.url, picture: item.hdurl, textDescription: item.explanation, date: item.date, copyright: item.copyright)
                                        
                                        onSuccess(temp)
                                    }
                                    catch {
                                        onFailure(NSError(domain: "Error", code: -1, userInfo: nil))
                                    }

                                    },
                                  onFailure: { error in
                                    onFailure(error)
                                })
        
    }
    
    
}
