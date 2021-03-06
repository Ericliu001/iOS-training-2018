//
// Created by Eric Liu on 6/14/18.
// Copyright (c) 2018 Eric Liu. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {

    var photos = [Photo]()

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "UICollectionViewCell"

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: <#T##IndexPath##Foundation.IndexPath#>)
        return cell
    }
}
