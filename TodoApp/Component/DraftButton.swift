import SwiftUI

struct DraftButton: View {
    
    @EnvironmentObject var userData: UserData
    @Binding var isPresentingModal: Bool  // モーダル表示のフラグ
    
    var body: some View {
        HStack {
            Spacer()
            
            if !self.userData.isEditing {
                Button(action: {
                    isPresentingModal = true  // ボタンを押した際にモーダルを表示
                }) {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                }
                .frame(width: 60, height: 60)
                .background(Color(red: 59/255, green: 177/255, blue: 250/255))
                .cornerRadius(30.0)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16.0))
            }
        }
    }
}

#Preview {
    DraftButton(isPresentingModal: .constant(false))
        .environmentObject(UserData())
}

