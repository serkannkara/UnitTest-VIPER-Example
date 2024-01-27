//
//  UnitTest_VIPER_ExampleTests.swift
//  UnitTest-VIPER-ExampleTests
//
//  Created by Serkan Kara on 24.01.2024.
//

import XCTest
@testable import UnitTest_VIPER_Example

final class UnitTest_VIPER_ExampleTests: XCTestCase {
    
    private var presenter: NewsListPresenter!
    private var interactor: NewsListInteractor!
    private var mockService: MockNewsListService!
    private var view: MockNewsListView!
    
    override func setUp() {
        mockService = MockNewsListService()
        interactor = NewsListInteractor(service: mockService)
        view = MockNewsListView()
        presenter = NewsListPresenter(interactor: interactor,
                                      view: view)
        view.presenter = presenter
    }
    
    func testFetchNews() throws {
        //Given
        let news = try ResourceLoader.loadNews(resource: .news)
        
        //When
        view.fetchNews()
        view.presenter = presenter
        
        //Then
        XCTAssertEqual(view.outputs.count, 3)
        XCTAssertEqual(view.outputs[0], .showLoading(isLoading: true))
        XCTAssertEqual(view.outputs[1], .showLoading(isLoading: false))
        XCTAssertEqual(view.outputs[2], .newsList(news: news))
    }
}

private class MockNewsListView: NewsListProtocolDelegate {
    
    var presenter: NewsListPresenter!
    var outputs: [NewsListPresenter.UserInteraction] = []
    
    func fetchNews() {
        presenter.fetchNews()
    }
    
    func handleOutput(output: UnitTest_VIPER_Example.NewsListPresenter.UserInteraction) {
        outputs.append(output)
    }
}
