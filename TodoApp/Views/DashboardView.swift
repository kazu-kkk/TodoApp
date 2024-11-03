import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var userData: UserData
    @State private var randomTasks: [Task] = []
    @State var taskTitle = ""
    @State var taskDate = ""
    
    var body: some View {
        
        
        VStack {
            //ヘッダー
            header
            
            VStack {
                
                VStack(spacing: 17) {
                    Text("タスク連続達成日数")
                        .font(Font.custom("Inter", size: 24).weight(.bold))
                        .foregroundColor(.black)
                    HStack(alignment: .bottom, spacing: 6) {
                        Text("21")
                            .font(Font.custom("Inter", size: 80).weight(.bold))
                            .foregroundColor(.black)
                        Text("days")
                            .font(Font.custom("Inter", size: 40).weight(.bold))
                            .foregroundColor(.black)
                    }
                }
                .frame(width: 350, height: 143)
                
                Spacer()
                    .frame(height: 40)
                
                VStack {
                    // ランダムな3つのタスクを表示
                    ForEach(randomTasks, id: \.id) { task in
                        Button {
                            // チェック状態を切り替える
                            toggleTaskCheck(task: task)
                            print("\(task.title)が押されました: チェック状態 = \(task.checked)")
                            
                        } label: {
                            ListRow(task: task.title, date: task.date, isCheck: task.checked)
                        }
                    }
                    Spacer()
                        .frame(height: 40)
                    // ランダム再表示ボタン
                    Button(action: {
                        // ランダムに再表示
                        updateRandomTasks()
                    }) {
                        Text("ランダムに再表示")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .onAppear {
                    // 初回表示時にもランダムな3つのタスクをセット
                    updateRandomTasks()
                }
                
                Spacer()
            }
            .padding(.vertical, 40)
        }
    }
    
    // タスクのチェック状態を切り替えるメソッド
    private func toggleTaskCheck(task: Task) {
        // userDataのタスク配列からタスクを見つけてチェック状態を切り替え
        if let index = self.userData.tasks.firstIndex(where: { $0.id == task.id }) {
            self.userData.tasks[index].checked.toggle()
            // randomTasksの中のタスクもチェック状態を更新
            if let randomTaskIndex = randomTasks.firstIndex(where: { $0.id == task.id }) {
                randomTasks[randomTaskIndex].checked.toggle()
            }
        }
    }
    
    // `randomTasks`を`userData.tasks`の最新の状態から3つランダムに取得するメソッド
    private func updateRandomTasks() {
        // チェックがfalseのタスクのみをフィルタリング
        let uncheckedTasks = userData.tasks.filter { !$0.checked }
        // フィルタリングされたタスクからランダムに3つ取得
        randomTasks = Array(uncheckedTasks.shuffled().prefix(3))
    }
    
    //    func createTask() {
    //        let newTask = Task(title: self.taskTitle, checked: false, date: taskDate)
    //        self.userData.tasks.insert(newTask, at: 0)
    //        self.taskTitle = ""
    //        self.userData.isEditing = false
    //    }
}

#Preview {
    DashboardView()
        .environmentObject(UserData())
}

extension DashboardView {
    //見出し
    private var header: some View {
        Header(heading: "アプリ名")
    }
    
    private var image: some View {
        Image("image")
    }
    
}
