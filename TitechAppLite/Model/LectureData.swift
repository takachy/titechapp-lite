//
//  LectureData.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/10/03.
//  Copyright © 2020 takachy. All rights reserved.
//

import Foundation

struct LectureData: Identifiable {
    let id: String
    
    struct Times: Decodable {
        let start: String
        let end: String
    }
    
    let name: String
    let time: Times
    let content: String
    let room: String
}

struct LectureDate: Identifiable {
    let id: String
    
    let month: Int
    let day: Int
    let dayOfWeek: String
}

struct Plan: Identifiable {
    let id: String
    
    let date: LectureDate
    let lectures: [LectureData]
}
