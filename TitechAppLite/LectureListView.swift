//
//  lecture_list_view.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/09/05.
//  Copyright © 2020 takachy. All rights reserved.
//

import SwiftUI
import Combine

struct Lecture: Identifiable{
    var id: ObjectIdentifier
    
    struct Time: Decodable{
        let start: String
        let end: String
    }
    let name: String
    let room: String
    let content: String
    let time: Time
}

struct LectureListView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(0..<10){_ in
                    LectureRow()
                }.listRowInsets(EdgeInsets())
            }
        .navigationBarTitle("スケジュール")
            
        }
    }
}

struct LectureListView_Previews: PreviewProvider {
    static var previews: some View {
        LectureListView()
    }
}
