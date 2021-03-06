//
//  LectureRow.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/09/05.
//  Copyright © 2020 takachy. All rights reserved.
//

import SwiftUI

struct LectureRow: View {
    let lecture: LectureData
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color("main"))
                .frame(width:5, height: 100)
            VStack(alignment: .leading, spacing: 24) {
                Text(lecture.time.start)
                    .font(.system(size: 13))
                    .foregroundColor(Color("textMain"))
                    
                Text(lecture.time.end)
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
            }

            VStack(alignment: .leading, spacing: 24) {
                Text(lecture.name)
                    .lineLimit(1)
                    .font(.system(size: 15))
                    .foregroundColor(Color("textMain"))
                    
                Text(lecture.content)
                    .lineLimit(1)
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
            }
            Spacer()
            Text(lecture.room)
                .lineLimit(2)
                .font(.system(size: 14))
                .foregroundColor(Color("main"))
                .frame(width:44)
                .padding()
        }
    }
}

struct LectureRow_Previews: PreviewProvider {
    static var previews: some View {
        LectureRow(lecture: LectureData(
                    id: "bbb",
                    name: "立志プロジェクト",
                    time: LectureData.Times(start: "8:50", end: "10:30"),
                    content: "ガイダンス",
                    room: "70周年記念講堂")
        )
    }
}
