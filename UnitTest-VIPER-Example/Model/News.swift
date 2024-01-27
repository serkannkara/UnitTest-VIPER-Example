//
//  News.swift
//  UnitTest-VIPER-Example
//
//  Created by Serkan Kara on 24.01.2024.
//

import Foundation

struct News: Codable, Hashable {
    let articles: [Articles]
}

struct Articles: Codable, Hashable{
    let title: String?
    let description: String?
}
