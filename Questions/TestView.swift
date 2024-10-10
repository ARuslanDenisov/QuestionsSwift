//
//  TestView.swift
//  Questions
//
//  Created by Руслан on 10.10.2024.
//

import SwiftUI

struct TestView: View {
    @State var questions: [QuestionModel] = []
    @State var intQuest = 0
    var questionValue = [4,8,13,17,21,24,25,27,34,37,40,44]
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Вопросы")
                    .font(.largeTitle)
                Button {
                    questions = QuestionsBank.shared.get3Quest()
                } label : {
                    Image(systemName: "arrow.counterclockwise")
                }
            }
            Button {
                intQuest = questionValue.randomElement()!
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.blue)
                    Text("Вопрос №" + intQuest.description)
                        .foregroundStyle(.white)
                }
                .frame(width: 120, height: 50)
            }
            Spacer()
            ScrollView (showsIndicators: false) {
                ForEach(questions, id: \.id) { question in
                    QuestionView(question: question)
                        .padding(10)
                }
            }
            .frame(height: 570)
            .onAppear {
                questions = QuestionsBank.shared.get3Quest()
            }
            Spacer()
        }
    }
}

#Preview {
    TestView()
}


