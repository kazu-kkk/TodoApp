import SwiftUI

struct TaskListView: View {
    
    @EnvironmentObject var userData: UserData
    @State private var taskTitle = ""
    @State private var taskDate = ""
    @State private var isPresentingModal = false  // モーダル表示のフラグ

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                // 見出し
                Header(heading: "Tasks")
                
                ScrollView {
                    VStack {
                        tasks
                        
                        if userData.isEditing {
                            HStack(spacing: 10) {
                                Ellipse()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.white)
                                    .overlay(
                                        Ellipse()
                                            .stroke(Color.gray, lineWidth: 1)
                                    )
                                
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
                        }
                    }
                    .padding(.bottom, 120)
                }
                .edgesIgnoringSafeArea(.all)
                .padding(.top, 20)
            }
            
            // DraftButtonにバインディングを渡す
            DraftButton(isPresentingModal: $isPresentingModal)
                .padding(.bottom, 40)
                .sheet(isPresented: $isPresentingModal) {
                    TaskDraftView(isPresentingModal: $isPresentingModal)
                        .environmentObject(userData)  // EnvironmentObjectとしてuserDataを渡す
                }
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
    ContentView()
        .environmentObject(UserData())
}

extension TaskListView {
    private var tasks: some View {
        ForEach(userData.tasks) { task in
            Button {
                guard let index = self.userData.tasks.firstIndex(of: task) else { return }
                self.userData.tasks[index].checked.toggle()
            } label: {
                ListRow(task: task.title, date: task.date, isCheck: task.checked)
            }
        }
    }
}

