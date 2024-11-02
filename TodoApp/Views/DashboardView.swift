//
//  DashboardView.swift
//  TodoApp
//
//  Created by ひろせ on 2024/09/30.
//

import SwiftUI

struct DashboardView: View {
    // UserDataver2のインスタンスを監視
    @EnvironmentObject var userData: UserData
    @State var taskTitle = ""
    @State var taskDate = ""
    
    var body: some View {
        
        NavigationView {

            VStack {
                
                // Image
               image
                Spacer()
                text
                
                // UserTaskver2View()を繰り返し表示
                ForEach(userData.tasks) { task in
                
                Button {
                        guard let index = self.userData.tasks.firstIndex(of: task) else {
                            return
                        }
                        
                        self.userData.tasks[index].checked.toggle()
                    
                    print("\(task.title)が押されました")
                    
                } label: {
                    ListRow(task: task.title, date: task.date, isCheck: task.checked)
                }
                }

                
                Spacer()
                
                // タスク一覧ボタン
                NavigationLink(destination: TaskListView()) { // TaskListViewに遷移
                   Text("タスク一覧")
                       .font(.system(size: 18, weight: .bold)) // フォントサイズとスタイル
                       .foregroundColor(.white) // 文字色
                       .padding() // 内側の余白
                       .frame(width: 200, height: 50) // ボタンのサイズ
                       .background(Color(red: 59/255, green: 177/255, blue: 250/255)) // 背景色
                       .cornerRadius(10) // 角丸
                       .shadow(color: Color.black.opacity(0.3), radius: 5, x: 2, y: 2) // 影の設定
               }
                
                }
                .padding(.vertical, 40)
                
            
                
        }
        }
    
    func createTask() {
        let newTask = Task(title: self.taskTitle, checked: false, date: taskDate)
        self.userData.tasks.insert(newTask, at: 0)
        self.taskTitle = ""
        self.userData.isEditing = false
    }
    
 
}

#Preview {
    DashboardView()
        .environmentObject(UserData())
}


extension DashboardView {
    
    
    private var image : some View {
        Image("image")
    }
    
    
    private var text : some View {
        Text("Today's Tasks")
            .font(Font.custom("Inter", size: 32).weight(.bold))
            .foregroundColor(.black)
    }
    
}



