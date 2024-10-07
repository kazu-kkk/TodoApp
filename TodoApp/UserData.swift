//
//  UserDataver2.swift
//  TodoApp
//
//  Created by ひろせ on 2024/10/02.
//

import SwiftUI



class UserData: ObservableObject {
    @Published var tasks = [
        Task(title: "散歩", checked: false, date: "2024/3/19"),
        Task(title: "料理", checked: false, date: "2024/3/19"),
        Task(title: "筋トレ", checked: true, date: "2024/4/19"),
        Task(title: "散歩", checked: false, date: "2024/3/19"),
        Task(title: "料理", checked: false, date: "2024/3/19"),
        Task(title: "筋トレ", checked: true, date: "2024/4/19"),
        Task(title: "散歩", checked: false, date: "2024/3/19"),
        Task(title: "料理", checked: false, date: "2024/3/19"),
        Task(title: "筋トレ", checked: true, date: "2024/4/19"),
        Task(title: "散歩", checked: false, date: "2024/3/19"),
        Task(title: "料理", checked: false, date: "2024/3/19"),
        Task(title: "筋トレ", checked: true, date: "2024/4/19"),
        Task(title: "散歩", checked: false, date: "2024/3/19"),
        Task(title: "料理", checked: false, date: "2024/3/19"),
        Task(title: "筋トレ", checked: true, date: "2024/4/19")
    ]
    
    @Published var isEditing: Bool = false
}
