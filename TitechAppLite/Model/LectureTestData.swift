//
//  LectureTestData.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/10/03.
//  Copyright © 2020 takachy. All rights reserved.
//

import Foundation

struct LectureTestData {
    let plans: [Plan] = [
        Plan(
            id: "i",
            date: LectureDate(month: 10, day: 2, dayOfWeek: "土"),
            lectures: [
                LectureData(
                    id: "ddd",
                    name: "立志プロジェクト",
                    time: LectureData.Times(start: "8:50", end: "10:30"),
                    content: "ガイダンス",
                    room: "70周年記念講堂"
                ),
                LectureData(
                    id: "eee",
                    name: "ARC104",
                    time: LectureData.Times(start: "21:00", end: "22:40"),
                    content: "400点早解き勝負",
                    room: "AtCoder"
                )
            ]
        ),
        Plan(
            id: "j",
            date: LectureDate(month: 10, day: 3, dayOfWeek: "日"),
            lectures: []
        ),
        Plan(
            id: "k",
            date: LectureDate(month: 10, day: 4, dayOfWeek: "月"),
            lectures: [
                LectureData(
                    id: "hhh",
                    name: "教養卒論",
                    time: LectureData.Times(start: "8:50", end: "12:20"),
                    content: "ガイダンス",
                    room: "70周年記念講堂"
                )
            ]
        )
    ]
}

