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
    @Published var plans: [Plan] = LectureTestData().plans
    
}
