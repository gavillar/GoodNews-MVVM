//
//  Article.swift
//  goodnews
//
//  Created by user220831 on 5/22/22.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}


