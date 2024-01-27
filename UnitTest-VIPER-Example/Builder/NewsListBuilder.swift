//
//  NewsListBuilder.swift
//  UnitTest-VIPER-Example
//
//  Created by Serkan Kara on 24.01.2024.
//

import UIKit

protocol NewsListBuilderInterface {
    func build() -> UIViewController
}

final class NewsListBuilder: NewsListBuilderInterface {
    func build() -> UIViewController {
        let vc = NewsListVC.init(nibName: "NewsListVC", bundle: nil)
        let service = NetworkServiceImpl()
        let interactor = NewsListInteractor(service: service)
        let presenter: NewsListPresenterProtocol = NewsListPresenter(interactor: interactor, view: vc)
        vc.inject(presenter: presenter)
        return vc
    }
}
