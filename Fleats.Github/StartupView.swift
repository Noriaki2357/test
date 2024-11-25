//
//  StartupView.swift
//  Fleats
//
//  Created by 素数235711 on 2024/10/31.
//

import SwiftUI

struct StartupView: View {
    @State private var logoOpacity: Double = 1.0
    @State private var showPhoneNumberView = false
    
    var body: some View {
        NavigationStack{
            if showPhoneNumberView {
                PhoneNumberView()
                NavigationLink {
                    PhoneNumberView()
                } label: {
                    Text("")
                    
                }// PhoneNumberViewに移行
            } else {
                ZStack {
                    Color.white
                        .ignoresSafeArea() // 背景色を白に設定
                    
                    Image("Fleatslogo") // アイコン画像の名前を指定
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .opacity(logoOpacity) // アニメーションの不透明度を変更
                        .onAppear {
                            // アニメーションでフェードアウト
                            withAnimation(.easeOut(duration: 0.5)) {
                                logoOpacity = 0.0
                            }
                            // アニメーションが終わった後にPhoneNumberViewに遷移
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showPhoneNumberView = true
                            }
                        }
                }
            }
        }
    }
}




#Preview {
    StartupView()
}

