import SwiftUI

struct ContentView: View {
    
    // タブの選択項目を保持する
    @State var selection = 1
    
    var body: some View {
        
        TabView(selection: $selection) {
            
            DashboardView()   // Viewファイル①
                .tabItem {
                    Label("Page1", systemImage: "1.circle")
                }
                .tag(1)
            
            TaskListView()   // Viewファイル②
                .tabItem {
                    Label("Page2", systemImage: "2.circle")
                }
                .tag(2)
            
            SettingsView()  // Viewファイル③
                            .tabItem {
                                Label("Page3", systemImage: "3.circle")
                            }
                            .tag(3)
            
        } // TabView ここまで
        
    } // body
} // View

#Preview {
    ContentView()
        .environmentObject(UserData())
}
