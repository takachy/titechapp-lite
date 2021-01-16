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
    @ObservedObject var viewModel = LectureViewModel()
    @State private var showingModal = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.plans) { plan in
                    Section(header: LectureHeader(date: plan.date)) {
                        ForEach(plan.lectures) { lecture in
                            LectureRow(lecture: lecture)
                        }
                    }
                }.listRowInsets(EdgeInsets())
            }
            .toolbar {
                Button(action: {
                    self.showingModal.toggle()
                }, label: {
                    Text("設定")
                })
                // .sheet(isPresented: $showingModal) {
//                urlSetting()
//            }
            .sheet(isPresented: $showingModal,
                   onDismiss: { self.viewModel.appear() },
                   content: { urlSetting() }
            )
                
            }
            .navigationBarTitle("スケジュール")
        }
        .onAppear(){
            self.viewModel.appear()
        }
    }
}

struct LectureListView_Previews: PreviewProvider {
    static var previews: some View {
        LectureListView()
    }
}
