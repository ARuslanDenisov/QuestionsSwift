//
//  QuestionOneView.swift
//  Questions
//
//  Created by Руслан on 18.10.2024.
//

import SwiftUI

struct QuestionOneView: View {
    var question: QuestionModel
    let ind = 1
    var body: some View {
        VStack {
            Text("Вопрос")
                .font(.title)
            QuestionView2(question: question)
            Spacer()
        }
    }
    init(_ question: QuestionModel) {
        self.question = question
    }
}

#Preview {
    QuestionOneView(QuestionModel(question: "jbwkjwbqkjwebjkbfjewbfewbfbkewbfbekwfbkwbfkweb§", answer: "jbfjkbfjkbkfsbsjkbfsjabfjksabfjaksbfjksfbjkasbksbkjfbksabjfaksjfbksabkjbfbsajkfsbkbasfkj"))
}
