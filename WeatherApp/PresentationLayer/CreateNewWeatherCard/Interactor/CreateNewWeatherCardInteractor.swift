//
//  CreateNewWeatherCardInteractor.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 29.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs
import RxSwift

protocol CreateNewWeatherCardRouting: ViewableRouting {}

protocol CreateNewWeatherCardPresentable: Presentable {
    var listener: CreateNewWeatherCardPresentableListener? { get set }
}

protocol CreateNewWeatherCardListener: class {
    func createNewWeatherCard()
    func closeNewWeatherCard()
}

final class CreateNewWeatherCardInteractor: PresentableInteractor<CreateNewWeatherCardPresentable>, CreateNewWeatherCardInteractable, CreateNewWeatherCardPresentableListener {

    weak var router: CreateNewWeatherCardRouting?
    weak var listener: CreateNewWeatherCardListener?

    override init(presenter: CreateNewWeatherCardPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }

    // MARK: - CreateNewWeatherCardPresentableListener

    func createNewWeatherCard() {
        listener?.createNewWeatherCard()
    }

    func closeNewWeatherCard() {
        listener?.closeNewWeatherCard()
    }
}
