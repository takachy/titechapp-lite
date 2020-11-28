//
//  ICalData2LectureData.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/10/24.
//  Copyright © 2020 takachy. All rights reserved.
//
import Foundation

extension Date {
    func beginningOfDay() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.startOfDay(for: self)
    }
}

struct ScheduleTranslator {
    static func Date2LectureDate(data: Date) -> String { // Date型からスケジュール欄に表示する日付のStringに変換
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "M月d日 E曜日"
        return dateFormatter.string(from: data)
    }
    
    static func setPlanList(today : Date) -> [Plan]{ // 日付と空の講義情報が入ったPlanの配列を生成
        var planList : [Plan] = []
        for i in 0..<120 {
            let thisDay = Calendar.current.date(byAdding: .day, value: i, to: today)!
            let thisDaysPlan = Plan(id: String(i), date: Date2LectureDate(data: thisDay), lectures: [])
            planList.append(thisDaysPlan)
        }
        return planList
    }
    
    static func calcDateRemainder(firstDate: Date, secondDate: Date) -> Int { // firstDate - secondDateが何日あるかをIntで返す

        var retInterval:Double!
        let firstDateReset = firstDate.beginningOfDay()
        let secondDateReset = secondDate.beginningOfDay()
        
        retInterval = firstDateReset.timeIntervalSince(secondDateReset)
        let ret = retInterval/86400

        return Int(floor(ret))  // n日
    }
    
    static func traslate(data: [ICalData]) -> [Plan] { // 実際に変換する関数
        let today = Date()
        var planList : [Plan] = setPlanList(today: today)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "H:mm"
        
        for lecture in data {
            let initialDate = Date(timeIntervalSince1970: 0) // 1970/1/1
            if lecture.dtstart == initialDate || lecture.dtend == initialDate {
                continue
            }
            let id : String = lecture.uid
            let name : String = lecture.summary
            let start = dateFormatter.string(from: lecture.dtstart)
            let end = dateFormatter.string(from: lecture.dtend)
            let time = LectureData.Times(start: start, end: end)
            let content = lecture.description
            let room = lecture.location
            
            let LectureDetail = LectureData(id: id, name: name, time: time, content: content, room: room)
            
            let interval = calcDateRemainder(firstDate: lecture.dtstart, secondDate: today)
            
            if 0 <= interval && interval < 120 {
                planList[interval].lectures.append(LectureDetail)
            }
            
        }
        return planList
    }
}
