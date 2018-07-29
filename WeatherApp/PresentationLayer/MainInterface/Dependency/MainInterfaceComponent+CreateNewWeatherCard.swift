//
//  MainInterfaceComponent+CreateNewWeatherCard.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 29.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs

protocol MainInterfaceDependencyCreateNewWeatherCard: Dependency {}
extension MainInterfaceComponent: CreateNewWeatherCardDependency {}
