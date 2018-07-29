//
//  CreateNewWeatherCardBuilder.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 29.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs

protocol CreateNewWeatherCardDependency: Dependency {}

final class CreateNewWeatherCardComponent: Component<CreateNewWeatherCardDependency> {}

// MARK: - Builder

protocol CreateNewWeatherCardBuildable: Buildable {
    func build(withListener listener: CreateNewWeatherCardListener) -> CreateNewWeatherCardRouting
}

final class CreateNewWeatherCardBuilder: Builder<CreateNewWeatherCardDependency>, CreateNewWeatherCardBuildable {

    override init(dependency: CreateNewWeatherCardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CreateNewWeatherCardListener) -> CreateNewWeatherCardRouting {
        let viewController = UIViewController.instantiateFromStoryboard(CreateNewWeatherCardConstants.storyboardId) as! CreateNewWeatherCardViewController
        let interactor = CreateNewWeatherCardInteractor(presenter: viewController)
        interactor.listener = listener
        return CreateNewWeatherCardRouter(interactor: interactor, viewController: viewController)
    }
}
