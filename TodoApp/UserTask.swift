//
//  UserTaskver2.swift
//  TodoApp
//
//  Created by ひろせ on 2024/09/30.
//

import SwiftUI



struct Task: Identifiable, Equatable{
    let id = UUID()
    var title: String
    var checked: Bool
    var date: String
    
    init(title: String, checked: Bool, date: String){
        self.title = title
        self.checked = checked
        self.date = date
    }
}



