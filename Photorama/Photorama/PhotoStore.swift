//
//  PhotoStore.swift
//  Photorama
//
//  Created by Eric Liu on 6/14/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import UIKit


enum PhotosResult {
    case success([Photo])
    case failure(Error)
}

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}


enum PhotoError: Error {
    case imageCreationError
}

class PhotoStore {

    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    func fetchInterestingPhotos(completion: @escaping (PhotosResult) -> Void) {
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in

            if let jsonData = data {

                let result = self.processPhotosRequest(data: data, error: error)
                OperationQueue.main.addOperation {
                    completion(result)
                }


            } else if let requestError = error {
                print("Error fetching interesting photos: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
        }

        task.resume()
    }

    private func processPhotosRequest(data: Data?, error: Error?) -> PhotosResult {
        guard let jsonData = data else {
            return .failure(error!)
        }

        return FlickrAPI.photos(fromJson: jsonData)
    }

    func fetchImage(for photo: Photo, completion: @escaping (ImageResult) -> Void) {
        let photoURL = photo.remoteURL
        let request = URLRequest(url: photoURL)

        let task = session.dataTask(with: request) {
            (data, response, error ) -> Void in

            let result = self.processImageRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }

        task.resume()
    }


    func processImageRequest(data: Data?, error: Error?) -> ImageResult {
        guard
                let imageData = data,
                let image = UIImage(data: imageData)
                else {

            // Couldn't create an image
            if data == nil {
                return .failure(error!)
            } else {
                return .failure(PhotoError.imageCreationError)
            }
        }

        return .success(image)
    }
}
