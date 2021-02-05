//
//  P1_QuizApp.swift
//  P1 Quiz
//
//  Created by Jaime on 10/10/2020.
//

import SwiftUI

@main
struct P1_QuizApp: App {
    
    let quizModel: QuizModel = {
        let qm = QuizModel()
        qm.load()
        return qm
    }()
    
    
    let imageStore = ImageStore()
    
    let scoreModel = ScoreModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(imageStore)
                .environmentObject(scoreModel)
                .environmentObject(quizModel)
        }
    }
}
