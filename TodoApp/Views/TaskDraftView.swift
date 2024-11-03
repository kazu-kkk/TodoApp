import SwiftUI

struct TaskDraftView: View {
    @Binding var isPresentingModal: Bool
    @EnvironmentObject var userData: UserData  // ← EnvironmentObjectとして宣言
    @State private var taskTitle = ""
    @State private var taskDate = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("タスクのタイトルを入力", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("期限を入力", text: $taskDate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    createTask()
                    isPresentingModal = false  // モーダルを閉じる
                }) {
                    Text("タスクを保存")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .padding()
            .navigationTitle("新しいタスク")
            .navigationBarItems(trailing: Button("キャンセル") {
                isPresentingModal = false  // モーダルを閉じる
            })
        }
    }
    
    private func createTask() {
        guard !taskTitle.isEmpty else { return }
        let newTask = Task(title: taskTitle, checked: false, date: taskDate)
        userData.tasks.insert(newTask, at: 0)
    }
}

#Preview {
    TaskDraftView(isPresentingModal: .constant(true))
        .environmentObject(UserData())
}

