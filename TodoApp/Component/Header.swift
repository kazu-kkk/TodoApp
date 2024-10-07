//
//  Header.swift
//  TodoApp
//
//  Created by ひろせ on 2024/10/07.
//

import SwiftUI

struct Header: View {
    
    var heading: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(heading)
                .font(Font.custom("Inter", size: 32).weight(.bold))
                .foregroundColor(.white)
            
        }
        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
        .frame( height: 60)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color(red: 0.23, green: 0.69, blue: 0.98))
    }
}

#Preview {
    Header(heading: "見出し")
}
