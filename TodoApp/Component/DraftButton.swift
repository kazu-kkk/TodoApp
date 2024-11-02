//
//  DraftButton.swift
//  TodoApp
//
//  Created by ひろせ on 2024/10/04.
//

import SwiftUI

struct DraftButton: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
            HStack { // --- 2
                Spacer()
                
                if self.userData.isEditing {
                    
                    
                } else {
                    Button(action: {
                        self.userData.isEditing = true
                        
                    })
                    {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 24)) // --- 4
                    }
                    .frame(width: 60, height: 60)
                    .background(Color(red: 59/255, green: 177/255, blue: 250/255))
                    .cornerRadius(30.0)
                    .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom:0, trailing: 16.0)) // --- 5
                }
            }
    }
}

#Preview {
    DraftButton()
        .environmentObject(UserData())
}
