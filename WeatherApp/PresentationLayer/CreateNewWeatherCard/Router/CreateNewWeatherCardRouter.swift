//
//  CreateNewWeatherCardRouter.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 29.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs

protocol CreateNewWeatherCardInteractable: Interactable {
    var router: CreateNewWeatherCardRouting? { get set }
    var listener: CreateNewWeatherCardListener? { get set }
}

protocol CreateNewWeatherCardViewControllable: ViewControllable {}

final class CreateNewWeatherCardRouter: ViewableRouter<CreateNewWeatherCardInteractable, CreateNewWeatherCardViewControllable>, CreateNewWeatherCardRouting {

    override init(interactor: CreateNewWeatherCardInteractable, viewController: CreateNewWeatherCardViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
