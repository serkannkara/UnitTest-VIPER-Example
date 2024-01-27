//
//  NewsListVC.swift
//  UnitTest-VIPER-Example
//
//  Created by Serkan Kara on 24.01.2024.
//

import UIKit

protocol NewsListProtocolDelegate: AnyObject {
    func handleOutput(output: NewsListPresenter.UserInteraction)
}

class NewsListVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: NewsListPresenterProtocol!
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchNews()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func inject(presenter: NewsListPresenterProtocol) {
        self.presenter = presenter
    }
}

extension NewsListVC: NewsListProtocolDelegate {
    func handleOutput(output: NewsListPresenter.UserInteraction) {
        switch output {
        case .showLoading(let isLoading):
            isLoading ? startLoading() : stopLoading()
        case .newsList(let news):
            DispatchQueue.main.async { [weak self] in
                self?.news = news
                self?.tableView.reloadData()
            }
        }
    }
}

extension NewsListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let article = news?.articles[indexPath.row]
        cell.textLabel?.text = article?.title
        return cell
    }
}
