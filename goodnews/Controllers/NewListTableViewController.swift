//
//  NewListTableViewController.swift
//  goodnews
//
//  Created by user220831 on 5/21/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var artuckeListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
  
        let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-05-22&to=2022-05-22&sortBy=popularity&apiKey=d5fb5834d91e4093877768d455b9dbc0")!
        
//    https://newsapi.org/v2/everything?q=apple&from=2022-05-22&to=2022-05-22&sortBy=popularity&apiKey=d5fb5834d91e4093877768d455b9dbc0
        
        
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles {
                    
                self.artuckeListVM = ArticleListViewModel(articles: articles)
        
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
             }
            
            }
            
        }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.artuckeListVM == nil ? 0 : self.artuckeListVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.artuckeListVM.numberOfRowsSection(section)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.artuckeListVM.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
}
