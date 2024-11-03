//
//  SettingsView.swift
//  TodoApp
//
//  Created by ひろせ on 2024/11/03.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            VStack {
                //見出し
                Header(heading: "設定")
                List {
                    Section(header: Text("一般設定")) {
                        NavigationLink(destination: AccountSettingsView()) {
                            HStack {
                                Image(systemName: "person.circle")
                                    .foregroundColor(.blue)
                                Text("アカウント")
                            }
                        }
                        
                        NavigationLink(destination: NotificationSettingsView()) {
                            HStack {
                                Image(systemName: "bell.circle")
                                    .foregroundColor(.orange)
                                Text("通知")
                            }
                        }
                        
                        NavigationLink(destination: PrivacySettingsView()) {
                            HStack {
                                Image(systemName: "lock.circle")
                                    .foregroundColor(.purple)
                                Text("プライバシー")
                            }
                        }
                    }
                    
                    Section(header: Text("サポート")) {
                        NavigationLink(destination: AboutView()) {
                            HStack {
                                Image(systemName: "info.circle")
                                    .foregroundColor(.green)
                                Text("このアプリについて")
                            }
                        }
                        
                        NavigationLink(destination: HelpView()) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(.red)
                                Text("ヘルプ")
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle()) // iOS 14以上で利用可能なリストスタイル
                
            }

        }
    }
}



struct NotificationSettingsView: View {
    var body: some View {
        Text("通知設定")
            .navigationTitle("通知")
    }
}

struct PrivacySettingsView: View {
    var body: some View {
        Text("プライバシー設定")
            .navigationTitle("プライバシー")
    }
}

struct AboutView: View {
    var body: some View {
        Text("このアプリについて")
            .navigationTitle("このアプリについて")
    }
}

struct HelpView: View {
    var body: some View {
        Text("ヘルプ")
            .navigationTitle("ヘルプ")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
