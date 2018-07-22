//
//  UIViewControllerHelper.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 22.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController
{
    class func instantiateFromStoryboard(_ name: String) -> UIViewController
    {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: name)
        return viewController
    }
}
