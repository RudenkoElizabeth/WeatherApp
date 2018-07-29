//
//  CollectionViewCell.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 29.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import UIKit

class MainInterfaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var weatherCard: UIView!

    override func prepareForReuse() {
        super.prepareForReuse()
        weatherCard.reloadInputViews()
    }
    
}
