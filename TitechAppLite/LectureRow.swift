//
//  LectureRow.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/09/05.
//  Copyright © 2020 takachy. All rights reserved.
//

import SwiftUI

struct LectureRow: View {
    
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color("main"))
                .frame(width:5, height: 100)
            VStack(alignment: .leading, spacing: 24){
                Text("08:50")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textMain"))
                    
                Text("10:30")
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))

            }

            VStack(alignment: .leading, spacing: 24){
                Text("電磁気学aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                    .lineLimit(1)
                    .font(.system(size: 15))
                    .foregroundColor(Color("textMain"))
                    
                Text("Week1 Descriptionaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                    .lineLimit(1)
                    .font(.system(size: 13))
                    .foregroundColor(Color("textSub"))
            }
            Spacer()
            Text("W222aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
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
        LectureRow()
    }
}
