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
                ListRowver2(task: task.title, date: task.date, isCheck: task.checked)
            }
            
            Text("あと3個完了で1回引ける")
                .font(Font.custom("Inter", size: 16).weight(.bold))
                .lineSpacing(24)
                .foregroundColor(Color(red: 0.23, green: 0.69, blue: 0.98))
        }
        .padding(.vertical, 80)
    }
}

#Preview {
    DashboardView()
        .environmentObject(UserDataver2())
}

