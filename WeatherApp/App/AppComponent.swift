//
//  AppComponent.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, MainInterfaceDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
