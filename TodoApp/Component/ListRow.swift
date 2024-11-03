//
//  ListRowver2.swift
//  TodoApp
//
//  Created by ひろせ on 2024/10/02.
//

import SwiftUI



struct ListRow : View {
    let task: String
    let date: String
    var isCheck : Bool
    
    
    
    var body: some View {
        HStack(spacing: 10) {
            //チェック
            if (isCheck == true) {
                //未完了のとき
                ZStack() {
                    Ellipse()
                        .foregroundColor(.white) // ここで背景色を設定
                        .frame(width: 15, height: 15)
                        .offset(x: 0, y: 0)
                        .offset(x: 0, y: 0)
                    Ellipse()
                        .foregroundColor(Color(red: 0.23, green: 0.69, blue: 0.98)) // ここで青色を設定
                        .frame(width: 7, height: 7)
                        .offset(x: 0, y: 0)
                }
                    .frame(width: 15, height: 15)


            } else  {
                
                //完了のとき
                Ellipse()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.white)
                    .overlay(
                        Ellipse()
                            .stroke(Color.gray, lineWidth: 1)
                    )
                

            }
            
            //テキスト
            VStack(alignment: .leading, spacing: 4) {
                Text(task)
                    .font(Font.custom("Inter", size: 16))
                    .foregroundColor(.black)

                HStack(alignment: .top, spacing: 10) {
                    Text("期限")
                        .font(Font.custom("Inter", size: 12))
                        .foregroundColor(Color.gray)

                    Text(date)
                        .font(Font.custom("Inter", size: 12))
                        .foregroundColor(Color.gray)
                }
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
        .frame(width: 350, height: 72)
        .background(Color(red: 0.90, green: 0.96, blue: 1))
        .cornerRadius(8)
    }
}

#Preview {
    DashboardView()
        .environmentObject(UserData())
}




