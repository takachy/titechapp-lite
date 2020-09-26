//
//  LectureHeader.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/09/26.
//  Copyright © 2020 takachy. All rights reserved.
//

import SwiftUI

struct LectureHeader: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color("grayMain"))
                .frame(width:5, height: 55)
            Text("7月18日 木曜日")
                .font(.system(size: 13))
                .foregroundColor(Color("textSub"))
            Spacer()
        }.background(Color("backgroundMain"))
    }
}

struct LectureHeader_Previews: PreviewProvider {
    static var previews: some View {
        LectureHeader().previewLayout(.sizeThatFits)
    }
}
