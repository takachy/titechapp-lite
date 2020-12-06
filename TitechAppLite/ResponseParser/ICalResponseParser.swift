//
//  iCalResponsePerser.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/10/17.
//  Copyright © 2020 takachy. All rights reserved.
//

import Foundation

struct ICalData {
    var dtstamp : String
    var dtstart : Date
    var dtend : Date
    var location : String
    var description : String
    var summary : String
    var uid : String
    var transp : String
}


struct ICalResponseParser {
    static func parse(data: Data) -> [ICalData] {
        var icaldata: [ICalData] = []
        guard let icalstring = String(data: data, encoding: .utf8) else {
            return []
        }
        
        let splitICalString = icalstring.components(separatedBy: "\n")
        var veventFlag = false
        let initialDate = Date(timeIntervalSince1970: 0) // 1970/1/1
        var veventData = ICalData(dtstamp: "", dtstart: initialDate, dtend: initialDate, location: "", description: "", summary: "", uid: "", transp: "")
        for line in splitICalString { // iCalデータを1行ずつ探索
            let splittedLine = line.components(separatedBy: ":")
            guard splittedLine.count > 1 else {
                continue
            }

            let tag = splittedLine[0]
            let content = splittedLine[1]
            
            if veventFlag == false { // VEVENTの外
                if tag == "BEGIN" && content == "VEVENT" {
                    veventFlag = true
                }
            }
            else { // VEVNTの中
                switch tag {
                case "DTSTAMP":
                    veventData.dtstamp = content
                case "DTSTART;TZID=Asia/Tokyo":
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
                    dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
                    veventData.dtstart = dateFormatter.date(from: content) ?? initialDate
                case "DTEND;TZID=Asia/Tokyo":
                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
                    dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
                    veventData.dtend = dateFormatter.date(from: content) ?? initialDate
                case "LOCATION":
                    veventData.location = content
                case "DESCRIPTION":
                    veventData.description = content
                case "SUMMARY":
                    veventData.summary = content
                case "UID":
                    veventData.uid = content
                case "TRANSP":
                    veventData.transp = content
                case "END": // VEVENT の終了を検出
                    if content == "VEVENT"{
                        
                        if veventData.dtstamp != "" && veventData.dtstart != initialDate && veventData.dtend != initialDate && veventData.location != "" && veventData.description != "" && veventData.summary != "" && veventData.uid != "" && veventData.transp != "" {
                            icaldata.append(veventData)
                        }
                        
                        veventFlag = false
                        veventData = ICalData(dtstamp: "", dtstart: initialDate, dtend: initialDate, location: "", description: "", summary: "", uid: "", transp: "")
                    }
                default:
                    continue
                }
                
            }
        }
        return icaldata
    }
}
