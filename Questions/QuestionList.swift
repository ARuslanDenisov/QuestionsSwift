//
//  QuestionList.swift
//  Questions
//
//  Created by Руслан on 18.10.2024.
//

import SwiftUI

struct QuestionList: View {
    @State var questions: [QuestionModel] = []
    var body: some View {
        VStack {
            HStack {
                Text("Вопросы")
                    .font(.largeTitle)
            }
            ScrollView(showsIndicators: false) {
                ForEach(questions, id: \.id) { question in
                    NavigationLink(destination: QuestionOneView(question)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .background(.white)
                            Text(question.question)
                                .padding(.horizontal, 5)
                        }
                        .frame(height: 40)
                        .padding(.horizontal, 5)
                        .foregroundStyle(.black)
                    }
                }
            }
            .padding(.bottom, 20)
        }
        .onAppear {
            questions = QuestionsBank.shared.getAllQuestion()
        }
    }
}

#Preview {
    QuestionList()
}
