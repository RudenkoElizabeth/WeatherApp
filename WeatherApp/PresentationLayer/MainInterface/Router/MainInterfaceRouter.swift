//
//  MainInterfaceRouter.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs

protocol MainInterfaceInteractable: Interactable, CreateNewWeatherCardListener {
    var router: MainInterfaceRouting? { get set }
    var listener: MainInterfaceListener? { get set }
}

protocol MainInterfaceViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class MainInterfaceRouter: LaunchRouter<MainInterfaceInteractable, MainInterfaceViewControllable>, MainInterfaceRouting {

    private let createNewWeatherCardBuilder: CreateNewWeatherCardBuildable

    var currentRib: ViewableRouting?

    init(interactor: MainInterfaceInteractable,
         viewController: MainInterfaceViewControllable,
         createNewWeatherCardBuilder: CreateNewWeatherCardBuildable) {
        self.createNewWeatherCardBuilder = createNewWeatherCardBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    // MARK: - MainInterfaceRouting

    func presentCreateNewWeatherCard() {
        currentRib = createNewWeatherCardBuilder.build(withListener: interactor)
        guard let currentRib = self.currentRib else {
            fatalError("failed to allocate rib")
        }
        attachChild(currentRib)
        viewController.present(viewController: currentRib.viewControllable)
    }

    func dismissCreateNewWeatherCard() {
        if let currentRib = self.currentRib {
            detachChild(currentRib)
            viewController.dismiss(viewController: currentRib.viewControllable)
            self.currentRib = nil
        }
    }
}
