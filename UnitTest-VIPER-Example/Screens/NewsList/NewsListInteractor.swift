//
//  NewsListInteractor.swift
//  UnitTest-VIPER-Example
//
//  Created by Serkan Kara on 24.01.2024.
//

import Foundation

protocol NewsListInteractorProtocol {
    init(service: NetworkService)
    func fetchNews()
    var delegate: NewsListInteractorDelegate? { get set }
}

protocol NewsListInteractorDelegate: AnyObject {
    func handleOutput(output: NewsListInteractor.UserInteraction)
}

final class NewsListInteractor: NewsListInteractorProtocol {
    
    private var service: NetworkService
    private var news: News?
    weak var delegate: NewsListInteractorDelegate?
    
    required init(service: NetworkService) {
        self.service = service
    }
    
    func fetchNews() {
        delegate?.handleOutput(output: .showLoading(isLoading: true))
        service.fetchNews { [weak self] (result) in
            self?.delegate?.handleOutput(output: .showLoading(isLoading: false))
            switch result {
            case .success(let news):
                self?.news = news
                self?.delegate?.handleOutput(output: .newsList(news: news))
            case .failure:
                break
            }
        }
    }
}

extension NewsListInteractor {
    enum UserInteraction: Equatable {
        case showLoading(isLoading: Bool)
        case newsList(news: News)
    }
}
