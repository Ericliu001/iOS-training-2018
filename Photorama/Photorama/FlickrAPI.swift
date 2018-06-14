//
//  FlickrAPI.swift
//  Photorama
//
//  Created by Eric Liu on 6/14/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import Foundation

enum EndPoint: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickrAPI {
      private static let baseURLString = "https://api.flickr.com/services/rest"
        private static let apiKey = "a6d819499131071f158fd740860a5a88"
    
    private static func flickrURL (endPoint: EndPoint, parameters: [String : String]?) -> URL {
        
        var components = URLComponents(string: baseURLString)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": endPoint.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]

        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        return components.url!
    }
    
    static var interestingPhotosURL : URL {
        return flickrURL(endPoint: .interestingPhotos, parameters: ["extras": "url_h,date_taken"])
    }
}


