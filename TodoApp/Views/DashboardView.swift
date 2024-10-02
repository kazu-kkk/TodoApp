//
//  DashboardView.swift
//  TodoApp
//
//  Created by ひろせ on 2024/09/30.
//

import SwiftUI

struct DashboardView: View {
    // UserDataver2のインスタンスを監視
    @EnvironmentObject var userData: UserDataver2
    
    var body: some View {
        VStack {
            // Image
            Image("image")
            Spacer()
            
            Text("Tasks")
                .font(Font.custom("Inter", size: 32).weight(.bold))
                .foregroundColor(.black)
            
            // UserTaskver2View()を繰り返し表示
            ForEach(userData.tasks) { task in
                
                Button {
                        guard let index = self.userData.tasks.firstIndex(of: task) else {
                            return
                        }
                        
                        self.userData.tasks[index].checked.toggle()
                    
                    
                    print("\(task.title)が押されました")
                } label: {
                    ListRowver2(task: task.title, date: task.date, isCheck: task.checked)
                }

                
                
            }
            
            Text("あと3個完了で1回引ける！")
                .font(Font.custom("Inter", size: 16).weight(.bold))
                .lineSpacing(24)
                .foregroundColor(Color(red: 0.23, green: 0.69, blue: 0.98))
            
            Spacer()
            
            //タスク一覧ボタン
            Button(action: {
                
            }, label: {
                Text("タスク一覧")
            })
                .font(.system(size: 18, weight: .bold)) // フォントサイズとスタイル
                .foregroundColor(.white) // 文字色
                .padding() // 内側の余白
                .frame(width: 200, height: 50) // ボタンのサイズ
                .background(Color(red: 59/255, green: 177/255, blue: 250/255)) // 背景色
                .cornerRadius(10) // 角丸
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 2, y: 2) // 影の設定
        }
        .padding(.vertical, 80)
    }
}

#Preview {
    DashboardView()
        .environmentObject(UserDataver2())
}



