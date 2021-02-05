//
//  ScoreMode.swift
//  P1 Quiz
//
//  Created by Jaime on 13/10/2020.
//

import Foundation

class ScoreModel: ObservableObject {
    
    @Published var acertadas: Set<Int> = []
    
    init() {
        if let acertadas = UserDefaults.standard.object(forKey: "acertadas") as? Array<Int> {
            self.acertadas = Set(acertadas)
        }
        
    }
    
    func check(respuesta: String, quiz: QuizItem){
        let r1 = respuesta.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let r2 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        if r1 == r2,
           !acertadas.contains(quiz.id){
            acertadas.insert(quiz.id)
            
            UserDefaults.standard.set(Array<Int>(acertadas), forKey: "acertadas")
        }
    }
    
    func acertado(_ quiz: QuizItem) -> Bool{
        acertadas.contains(quiz.id)
    }
    
    func limpiar(){
        acertadas.removeAll()
        UserDefaults.standard.set(Array<Int>(acertadas), forKey: "acertadas")
    }

}
