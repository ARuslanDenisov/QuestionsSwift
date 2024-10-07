//
//  Test.swift
//  Questions
//
//  Created by Руслан on 02.10.2024.
//

import Foundation

protocol questionFull {
    var question: String { get set }
    var answer: String { get set }
}

extension questionFull {
    func printQuestion() {
        print(question)
    }
    
    var person: String {"Dima"}
}

