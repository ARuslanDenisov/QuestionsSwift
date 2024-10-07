//
//  ContentView.swift
//  Questions
//
//  Created by Руслан on 02.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var pick: String = "SwiftUI"
    @State var switcher: Bool = true
    @State var question: QuestionModel = QuestionModel(question: "Что такое модификаторы в SwiftUI?", answer: """
                Проперти враппер (property wrapper) добавляет слой разделения между кодом, отвечающим за хранение свойств, и кодом, отвечающим за объявление этого property wrapper.
                
                @Published - обертка, которая говорит, что при изменении будет перерисовка вью, на которой используется обернутое значение.
                
                @State - property wrapper, используется внутри View объекта и позволяет вашей вью реагировать на любые изменения.
                
                @Binding - property wrapper, используется для передачи значений в дочернюю (child) вью. Вью, принимающая биндинг, может читать проперти, реагировать на изменения от родительской вью и имеет доступ на запись проперти.
                
                @StateObject - наблюдение и изменение, можно использовать только 1 раз для каждого объекта, так как он создает и хранится в памяти.
                
                @ObservedObject - схож с @StateObject, за исключением того, что в нем не упоминается создание или хранение инстанса. ObservedObject используется для отслеживания изменений уже созданного объекта с использованием @StateObject.
                
                @EnvironmentObject - похож на @ObservedObject. Основное различие в том, что @EnvironmentObject доступен в большем диапазоне, во множестве вложенных вью.
                
                @Environment - считывает значение окружения ОС и перерисовывает вью, если что-то меняется.
                """)
    var body: some View {
        VStack {
            HStack {
                Text("Выбери тему вопросов:")
                Picker(selection: $pick) {
                    Text("Основные").tag("Main")
                    Text("SwiftUI").tag("SwiftUI")
                    Text("GCD").tag("GCD")
                    Text("Memory").tag("Memory")
                    Text("Архитектура").tag("Arch")
                    Text("Все").tag("All")
                } label: {
                    Text("Choose theme: ")
                }
                .onChange(of: pick) { oldValue, newValue in
                    question = QuestionsBank.shared.getRandonQuestion(newValue)
                    switcher = true
                }
            }
            HStack {
                Button(action: {
                    question = QuestionsBank.shared.getRandonQuestion(pick)
                    switcher = true
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: 50)
                        Text("Поменять вопрос")
                            .foregroundStyle(.white)
                    }
                })
            }
            Divider()
                .padding(.vertical, 20)
            VStack (alignment: .leading) {
                Text("Вопрос:")
                    .bold()
                Text(question.question)
                    .padding(.vertical, 10)
                HStack {
                    Text("Ответ:")
                        .bold()
                }
                ScrollView {
                    Text(question.answer)
                }
                .blur(radius: switcher ? 15 : 0)
                .onTapGesture {
                    switcher = false
                }
            }
            
            Spacer()
        }
        .animation(.easeInOut, value: switcher)
        .animation(.easeInOut, value: question.id)
        .padding()
    }
}

#Preview {
    ContentView()
}
