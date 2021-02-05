//
//  AnswerView.swift
//  Mi P1 Quiz
//
//  Created by JavierMac on 16/10/2020.
//

import SwiftUI

struct AnswerView: View {
    
    @Binding var alert: Bool
    
    var quiz: QuizItem
    
    var body: some View {
        
        HStack {
            Text("Answer: ")
                .bold()
            Spacer()
            Text(alert ? quiz.answer : "")
                .bold()
            Spacer()
            Toggle(isOn: $alert){
            }    }
    }
}

struct AnswerView_Previews: PreviewProvider {
    static let quizModel: QuizModel = {
        let qm = QuizModel()
        qm.loadExamples()
        return qm
    }()
    
    static var previews: some View {
        EmptyView()
        //QuizDetail(quiz: quizModel.quizzes[0])
    }
}
