//
//  QuizDetail.swift
//  P1 Quiz
//
//  Created by Jaime on 10/10/2020.
//

import SwiftUI

struct QuizDetail: View {
    
    @EnvironmentObject var scoreModel: ScoreModel
    
    @EnvironmentObject var quizModel: QuizModel
    
    @Binding var quiz: QuizItem
    
    @EnvironmentObject var imageStore: ImageStore
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @State var answer: String = ""
    
    @State var showAlert: Bool = false
    
    @State var showAlert2: Bool = false
    
    var body: some View {
        VStack {
            HStack{
                Text(quiz.question)
                    .font(.largeTitle)
                Button(action:{
                    self.quizModel.toggleFavourite(quiz)
                }){
                    Image(quiz.favourite ? "star_yellow" : "star_grey")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                }
            }
            Text("Puntos = \(scoreModel.acertadas.count)")
                .font(.headline)
            HStack{
                TextField("Escriba su respuesta",
                          text: $answer,
                          onCommit: {
                            scoreModel.check(respuesta: answer, quiz: quiz)
                            showAlert = true
                          })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    .alert(isPresented: $showAlert, content: {
                        
                        let r1 = answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                        let r2 = quiz.answer.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        return Alert(title: Text("Resultado:"),
                                     message: Text(r1 == r2 ? "Correcto" : "Incorrecto" ),
                                     dismissButton: .default(Text("Cerrar")))
                    })
                
            }
            .padding()
            
            if verticalSizeClass == .compact {
                
                HStack {
                    AnswerView(alert: $showAlert2, quiz: quiz)
                        .padding()
                    
                    ImageView(quiz:quiz)
                }
            } else {
                AnswerView(alert: $showAlert2, quiz: quiz)
                    .padding()
                ImageView(quiz:quiz)
            }
        }
    }
}

struct QuizDetail_Previews: PreviewProvider {
    
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
