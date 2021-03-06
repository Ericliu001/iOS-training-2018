//
//  ViewController.swift
//  Photorama
//
//  Created by Eric Liu on 6/14/18.
//  Copyright © 2018 Eric Liu. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var photoStore: PhotoStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        photoStore.fetchInterestingPhotos { (photosResult) -> Void in
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")

                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }

            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func updateImageView(for photo: Photo) {
        photoStore.fetchImage(for: photo) {
            (imageResult) -> Void in

            switch imageResult {
            case let .success(image):
                self.imageView.image = image

            case let .failure(error):
                print("Error downloading image \(error)")
            }


        }
    }

}

