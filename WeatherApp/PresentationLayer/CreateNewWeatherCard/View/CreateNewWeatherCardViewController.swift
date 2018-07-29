//
//  CreateNewWeatherCardViewController.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 29.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol CreateNewWeatherCardPresentableListener: class {
    func createNewWeatherCard()
    func closeNewWeatherCard()
}

final class CreateNewWeatherCardViewController: UIViewController, CreateNewWeatherCardPresentable, CreateNewWeatherCardViewControllable {

    weak var listener: CreateNewWeatherCardPresentableListener?
    let disposeBag = DisposeBag()

    @IBOutlet weak var createNewCardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}


// MARK: - Setup

extension CreateNewWeatherCardViewController {
    func setup() {
        setupCreateNewCardButton()
        setupBAckButton()
    }

    private func setupCreateNewCardButton() {
        createNewCardButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.listener?.createNewWeatherCard()
        })
            .disposed(by: disposeBag)
    }

    private func setupBAckButton() {
        backButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.listener?.closeNewWeatherCard()
        })
            .disposed(by: disposeBag)
    }
}
