//
//  MainInterfaceViewController+TableView.swift
//  WeatherApp
//
//  Created by Elizabeth Rudenko on 29.07.2018.
//  Copyright © 2018 Elizabeth Rudenko. All rights reserved.
//

import UIKit.UICollectionView
import RxDataSources
import RxSwift

// MARK: - DataSources

extension MainInterfaceViewController {
    func setupDataSource() {
        let rxDataSource = RxCollectionViewSectionedAnimatedDataSource<WeatherCardModel>(configureCell: { [weak self] (_, _, indexPath, _) in
            let cell = self?.setCell(indexPath)
            return cell!
            }, configureSupplementaryView: { [weak self] (_, _, kind, indexPath) in
                let reusableView = self?.setReusableView(kind: kind, indexPath: indexPath)
                return reusableView!
        })

        sections.asObservable()
            .bind(to: collectionView.rx.items(dataSource: rxDataSource))
            .disposed(by: disposeBag)
    }

    private func setCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainInterfaceConstants.cell,
                                                      for: indexPath) as! MainInterfaceCollectionViewCell
        cell.weatherCard.backgroundColor = .red
        return cell
    }

    private func setReusableView(kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView = self.collectionView
            .dequeueReusableSupplementaryView(ofKind: kind,
                                              withReuseIdentifier: MainInterfaceConstants.header,
                                              for: indexPath) as! MainInterfaceCollectionReusableView
        reusableView.addButton.rx.tap.subscribe(onNext: { [weak self] _ in
            self?.indexLastCell += 1
            self?.sections.value[0].items.append((self?.indexLastCell)!)
        })
            .disposed(by: disposeBag)

        return reusableView
    }
}

// MARK: - Delegate

extension MainInterfaceViewController: UICollectionViewDelegateFlowLayout {
    func setupDelegate() {
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(view.bounds.width)
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let height = Int((view.bounds.height - statusBarHeight - 50) / 5)
        return CGSize(width: width, height: height)
    }
}
