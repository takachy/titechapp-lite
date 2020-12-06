//
//  APIClient.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/11/28.
//  Copyright © 2020 takachy. All rights reserved.
//

import Foundation
import Combine

struct APIClient {
    let session: URLSession = .shared
    
    func fetch(url: URL) -> AnyPublisher<Data, URLError>{
        session
        .dataTaskPublisher(for: url)
        .map{ $0.data }
        .eraseToAnyPublisher()
    }
}
