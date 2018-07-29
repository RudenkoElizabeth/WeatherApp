//
//  MainInterfaceViewController.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol MainInterfacePresentableListener: class {
    func presentCreateNewWeatherCard()
}

final class MainInterfaceViewController: UIViewController, MainInterfacePresentable, MainInterfaceViewControllable {

    weak var listener: MainInterfacePresentableListener?
    var sections = Variable<[WeatherCardModel]>([WeatherCardModel(section: 0, items: [0])])
    var indexLastCell = 0
    let disposeBag = DisposeBag()

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        setupDelegate()
    }

    // MARK: - MainInterfaceViewControllable

    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }

    func dismiss(viewController: ViewControllable) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - MainInterfacePresentable

    func addNewWeatherCard() {
        indexLastCell += 1
        sections.value[0].items.append(indexLastCell)
    }
}
