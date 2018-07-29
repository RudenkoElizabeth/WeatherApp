//
//  MainInterfaceBuilder.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs

protocol MainInterfaceDependency: Dependency { }

final class MainInterfaceComponent: Component<MainInterfaceDependency> { }

// MARK: - Builder

protocol MainInterfaceBuildable: Buildable {
    func build() -> LaunchRouting
}

final class MainInterfaceBuilder: Builder<MainInterfaceDependency>, MainInterfaceBuildable {

    override init(dependency: MainInterfaceDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = MainInterfaceComponent(dependency: dependency)
        let viewController = UIViewController.instantiateFromStoryboard(MainInterfaceConstants.storyboardId) as! MainInterfaceViewController
        let interactor = MainInterfaceInteractor(presenter: viewController)
        let createNewWeatherCardBuilder = CreateNewWeatherCardBuilder(dependency: component)
        return MainInterfaceRouter(interactor: interactor,
                                   viewController: viewController,
                                   createNewWeatherCardBuilder: createNewWeatherCardBuilder)
    }
}
