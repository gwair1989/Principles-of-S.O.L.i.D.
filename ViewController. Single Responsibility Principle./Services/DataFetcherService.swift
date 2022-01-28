//
//  DataFetcherService.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 17/06/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = LocalDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchNewGames(completion: @escaping (AppGroup?) -> Void) {
        let urlNewGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
    
    func fetchFreeGames(completion: @escaping (AppGroup?) -> Void) {
        let urlFreeGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeGames, response: completion)
        
    }
    
    func fetchCountry(completion: @escaping ([Country]?) -> Void) {
        let urlString = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
        
    }
    
    func fetchLocalCountry(completion: @escaping ([Country]?) -> Void) {
        let localUrlString = "usersAPI.txt"
        localDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
}
