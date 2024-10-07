//
//  QuestionModel.swift
//  Questions
//
//  Created by Руслан on 02.10.2024.
//

import Foundation

class QuestionModel: Identifiable, questionFull {
    let id = UUID().uuidString
    
    var question: String
    var answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}
