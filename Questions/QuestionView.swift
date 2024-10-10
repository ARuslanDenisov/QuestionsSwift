//
//  QuestionView.swift
//  Questions
//
//  Created by Руслан on 10.10.2024.
//

import SwiftUI

struct QuestionView: View {
    var question: QuestionModel
    @State var check = false
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                Text(question.question)
                    .padding(10)
            }
            .frame(width: 350, height: 150)
            .onTapGesture {
                check.toggle()
            }
            if check {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.gray.opacity(0.1))
                        .blur(radius: 4.0)
                    ScrollView (showsIndicators: false){
                        Text(question.answer)
                            .padding(.top, 10)
                    }
                }
                .frame(width: 350, height: 150)
                .offset(y: -8)
                
            }
                
        }
        .animation(.easeInOut, value: check)
        
    }
}

#Preview {
    QuestionView(question: QuestionModel(question: "Почему происходит деление клеток газа?", answer: "ОЧень большой текст и ОЧень большой текст ОЧень большой текст ОЧень большой текст ОЧень большой текст ОЧень большой текст ОЧень большой текст"))
}
