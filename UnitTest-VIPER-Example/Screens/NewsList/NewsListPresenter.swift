//
//  NewsListPresenter.swift
//  UnitTest-VIPER-Example
//
//  Created by Serkan Kara on 24.01.2024.
//

import Foundation

protocol NewsListPresenterProtocol {
    init(interactor: NewsListInteractorProtocol,
         view: NewsListProtocolDelegate)
    func fetchNews()
}

protocol NewsListPresenterDelegate: AnyObject {
    func handleOutput(output: NewsListPresenter.UserInteraction)
}

final class NewsListPresenter: NewsListPresenterProtocol {
    
    private var interactor: NewsListInteractorProtocol?
    weak var view: NewsListProtocolDelegate?
    
    required init(interactor: NewsListInteractorProtocol,
         view: NewsListProtocolDelegate) {
        self.interactor = interactor
        self.view = view
        self.interactor?.delegate = self
    }
    
    func fetchNews() {
        interactor?.fetchNews()
    }
}

extension NewsListPresenter {
    enum UserInteraction: Equatable {
        case showLoading(isLoading: Bool)
        case newsList(news: News)
    }
}

extension NewsListPresenter: NewsListInteractorDelegate {
    func handleOutput(output: NewsListInteractor.UserInteraction) {
        switch output {
        case .showLoading(let isLoading):
            view?.handleOutput(output: .showLoading(isLoading: isLoading))
        case .newsList(let news):
            view?.handleOutput(output: .newsList(news: news))
        }
    }
}
