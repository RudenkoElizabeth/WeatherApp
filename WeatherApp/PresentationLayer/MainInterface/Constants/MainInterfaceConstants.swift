
//
//  MainInterfaceConstants.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import Foundation
import RxDataSources

class MainInterfaceConstants {
    // MARK: - MainInterfaceBuilder
    static let storyboardId = "MainInterfaceViewController"

    // MARK: - MainInterfaceViewController
    static let cell = "MainInterfaceCollectionViewCell"
    static let header = "MainInterfaceCollectionReusableView"
}

struct WeatherCardModel {
    let section: Int
    var items: [Item]
}

extension WeatherCardModel: AnimatableSectionModelType {
    typealias Item = Int

    var identity: Int {
        return section
    }
    init(original: WeatherCardModel, items: [Item]) {
        self = original
        self.items = items
    }
}
