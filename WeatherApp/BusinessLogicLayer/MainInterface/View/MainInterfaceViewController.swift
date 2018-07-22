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

protocol MainInterfacePresentableListener: class { }

final class MainInterfaceViewController: UIViewController, MainInterfacePresentable, MainInterfaceViewControllable {

    weak var listener: MainInterfacePresentableListener?
}
