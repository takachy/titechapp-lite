//
//  LectureViewModel.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/10/03.
//  Copyright © 2020 takachy. All rights reserved.
//

import Foundation
import Combine

class LectureViewModel: ObservableObject {
    private var cancellable: AnyCancellable?
    
    @Published var plans: [Plan] = []
    
    func appear() {
        cancellable = APIClient().fetch(
            url: UserDefaults.standard.url(forKey: "OCWi_url")
                ?? URL(string: "https://ocwi-mock.titech.app/ocwi/index.php?module=Ocwi&action=Webcal&iCalendarId=test")!
        )
        .map {data in
            ScheduleTranslator.traslate(data: ICalResponseParser.parse(data: data))
        }
        // おまじない, メインスレッドで受け取る
        .receive(on: DispatchQueue.main)
        .sink(
            receiveCompletion: { result in
                switch result{
                case .finished:
                    break
                case let .failure(error):
                    print(error)
                }
            },
            receiveValue: { plans in
                self.plans = plans
            }
        )
    }
}
