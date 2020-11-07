//
//  ICalData2LectureData.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/10/24.
//  Copyright © 2020 takachy. All rights reserved.
//
import Foundation

struct ScheduleTranslator {
    static func Date2LectureDate(data: Date) -> String { // Date型からスケジュール欄に表示する日付のStringに変換
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "M月d日 E曜日"
        return dateFormatter.string(from: data)
    }
    
    static func SetPlanList() -> [Plan]{ // 日付と空の講義情報が入ったPlanの配列を生成
        let today = Date()
        var PlanList : [Plan] = []
        for i in 0..<120 {
            let thisDay = Calendar.current.date(byAdding: .day, value: i, to: today)!
            let thisDaysPlan = Plan(id: String(i), date: Date2LectureDate(data: thisDay), lectures: [])
            PlanList.append(thisDaysPlan)
        }
        return PlanList
    }
    
    static func resetTime(date: Date) -> Date {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)

        components.hour = 0
        components.minute = 0
        components.second = 0

        return calendar.date(from: components)!
    }
    
    static func calcDateRemainder(firstDate: Date, secondDate: Date? = nil) -> Int { // firstDate - secondDateが何日あるかをIntで返す

        var retInterval:Double!
        let firstDateReset = resetTime(date: firstDate)

        if secondDate == nil {
            let nowDate: Date = Date()
            let nowDateReset = resetTime(date: nowDate)
            retInterval = firstDateReset.timeIntervalSince(nowDateReset)
        } else {
            let secondDateReset: Date = resetTime(date: secondDate!)
            retInterval = firstDate.timeIntervalSince(secondDateReset)
        }

        let ret = retInterval/86400

        return Int(floor(ret))  // n日
    }
    
    static func traslate(data: [ICalData]) -> [Plan] { // 実際に変換する関数
        var PlanList : [Plan] = SetPlanList()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        dateFormatter.dateFormat = "H:mm"
        
        for lecture in data {
            let id = lecture.uid
            let name = lecture.summary
            let start = dateFormatter.string(from: lecture.dtstart)
            let end = dateFormatter.string(from: lecture.dtend)
            let time = LectureData.Times(start: start, end: end)
            let content = lecture.description
            let room = lecture.location
            
            let LectureDetail = LectureData(id: id, name: name, time: time, content: content, room: room)
            
            let interval = calcDateRemainder(firstDate: lecture.dtstart, secondDate: Date())
            
            if 0 <= interval && interval < 120 {
                PlanList[interval].lectures.append(LectureDetail)
            }
            
        }
        
        return PlanList
    }
}
