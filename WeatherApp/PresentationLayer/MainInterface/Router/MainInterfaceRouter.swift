//
//  MainInterfaceRouter.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs

protocol MainInterfaceInteractable: Interactable {
    var router: MainInterfaceRouting? { get set }
    var listener: MainInterfaceListener? { get set }
}

protocol MainInterfaceViewControllable: ViewControllable { }

final class MainInterfaceRouter: LaunchRouter<MainInterfaceInteractable, MainInterfaceViewControllable>, MainInterfaceRouting {

    override init(interactor: MainInterfaceInteractable, viewController: MainInterfaceViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
