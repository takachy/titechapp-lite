//
//  urlSetting.swift
//  TitechAppLite
//
//  Created by 高嶋優希 on 2020/12/06.
//  Copyright © 2020 takachy. All rights reserved.
//

import SwiftUI

struct UrlSetting: View {
    @State private var url = ""
    @State private var isShown = true
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("https://", text: $url)
                .textFieldStyle(RoundedBorderTextFieldStyle())  // 入力域のまわりを枠で囲む
                .padding()  // 余白を追加
                .autocapitalization(UITextAutocapitalizationType.none)
                .keyboardType(.URL)
            Button(action: {
                guard let saveUrl = URL(string: url)
                    else{
                        print("Error")
                        return
                    }
                UserDefaults.standard.set(saveUrl, forKey: "OCWi_url")
                self.presentationMode.wrappedValue.dismiss()
                }
            ) {
                Text("保存")
            }
        }
    }
}

struct urlSetting_Previews: PreviewProvider {
    static var previews: some View {
        urlSetting()
    }
}
