//
//  LectureHeader.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/09/26.
//  Copyright © 2020 takachy. All rights reserved.
//

import SwiftUI

struct LectureHeader: View {
    let date: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color("grayMain"))
                .frame(width:5, height: 55)
            Text(date)
                .font(.system(size: 13))
                .foregroundColor(Color("textSub"))
            Spacer()
        }.background(Color("backgroundMain"))
    }
}

struct LectureHeader_Previews: PreviewProvider {
    static var previews: some View {
        LectureHeader(
            date: "10月2日 土曜日"
        ).previewLayout(.sizeThatFits)
    }
}
