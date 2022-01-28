//
//  LocalDataFetcher.swift
//  ViewController. Single Responsibility Principle.
//
//  Created by Алексей Пархоменко on 18/06/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import Foundation

class LocalDataFetcher: NetworkDataFetcher {
    
    override func fetchGenericJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't find \(urlString) in main bundle.")
            response(nil)
            return
        }
        
        let data = try? Data(contentsOf: file)
        
        let decoded = self.decodeJSON(type: T.self, from: data)
        response(decoded)
    }
    
}
