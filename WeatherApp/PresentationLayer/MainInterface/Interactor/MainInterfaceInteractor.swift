//
//  MainInterfaceInteractor.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs
import RxSwift

protocol MainInterfaceRouting: ViewableRouting { }

protocol MainInterfacePresentable: Presentable {
    var listener: MainInterfacePresentableListener? { get set }
}

protocol MainInterfaceListener: class { }

final class MainInterfaceInteractor: PresentableInteractor<MainInterfacePresentable>, MainInterfaceInteractable, MainInterfacePresentableListener {

    weak var router: MainInterfaceRouting?
    weak var listener: MainInterfaceListener?

    override init(presenter: MainInterfacePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}
