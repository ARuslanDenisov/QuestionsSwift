//
//  mainView.swift
//  Questions
//
//  Created by Руслан on 10.10.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Учим свифт")
                    .font(.largeTitle)
                Spacer()
                NavigationLink {
                    ContentView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.blue)
                        Text("Одиночные вопросы")
                            .foregroundStyle(.white)
                    }
                    .frame(width: 300, height: 100)
                }
                NavigationLink {
                    TestView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.blue)
                        Text("Проверь себя")
                            .foregroundStyle(.white)
                    }
                    .frame(width: 300, height: 100)
                }
                NavigationLink {
                    QuestionList()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.blue)
                        Text("Список вопросов")
                            .foregroundStyle(.white)
                    }
                    .frame(width: 300, height: 100)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
