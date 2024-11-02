//
//  TaskListView.swift
//  TodoApp
//
//  Created by ひろせ on 2024/10/03.
//

import SwiftUI

struct TaskListView: View {
    
    // UserDataver2のインスタンスを監視
    @EnvironmentObject var userData: UserData
    @State var taskTitle = ""
    @State var taskDate = ""
    
    
    
    
    var body: some View {
        
        
        ZStack( alignment: .bottom ) {
            
            VStack {
                //見出し
                text
                ScrollView {
                    VStack {

                        // UserTaskver2View()を繰り返し表示
                       tasks

                        //下書きタスク
                        if( userData.isEditing ) {
                            HStack(spacing: 10) {
                                //完了のとき
                                Ellipse()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.white)
                                    .overlay(
                                        Ellipse()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                
                                //追加タスクのテキスト入力
                                VStack(alignment: .leading, spacing: 4) {
                                    TextField("タスクを入力してください", text: $taskTitle,
                                         onCommit: {
                                   self.createTask()
                               })
                                        .font(Font.custom("Inter", size: 16))
                                        .foregroundColor(.black)

                                    HStack(alignment: .top, spacing: 10) {
                                        Text("期限")
                                            .font(Font.custom("Inter", size: 12))
                                            .foregroundColor(Color.gray)

                                        TextField("期限を入力してください", text: $taskDate,
                                             onCommit: {
                                       self.createTask()
                                   })
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
                        }else {
                            
                        }
                        
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
            }
            

            DraftButton()
                .padding(.bottom, 40) // 必要に応じて余白を調整
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
    TaskListView()
        .environmentObject(UserData())
}


extension TaskListView {
    //見出し
    private var text: some View {
        Header(heading: "Tasks")
    }
    
    
    // UserTaskver2View()を繰り返し表示
    private var tasks: some View {
       
        ForEach(userData.tasks) { task in
            //タスク
            Button {
                        guard let index = self.userData.tasks.firstIndex(of: task) else {
                        return
                    }
                
            self.userData.tasks[index].checked.toggle()
            
                
            } label: {
                ListRow(task: task.title, date: task.date, isCheck: task.checked)
            }
            
            
            
            
            
        }
        
    }
    
}
