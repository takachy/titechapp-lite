//
//  lecture_list_view.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/09/05.
//  Copyright © 2020 takachy. All rights reserved.
//

import SwiftUI
import Combine

struct LectureListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { _ in
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
