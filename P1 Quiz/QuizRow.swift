//
//  QuizRow.swift
//  P1 Quiz
//
//  Created by Jaime on 10/10/2020.
//

import SwiftUI

struct QuizRow: View {
    
    var quiz: QuizItem
    
    @EnvironmentObject var imageStore: ImageStore
    
    var body: some View {
        HStack{
            Image(uiImage: imageStore.image(url: quiz.attachment?.url))
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(radius: 10)
            Text(quiz.question)
            Spacer()
            VStack{
                Image(uiImage: imageStore.image(url: quiz.author?.photo?.url))
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Spacer()
                //Text(quiz.author!.username!)
                //.font(.callout)
            }
        }
    }
}

struct QuizRow_Previews: PreviewProvider {
    
    static let quizModel: QuizModel = {
        let qm = QuizModel()
        qm.loadExamples()
        return qm
    }()
    
    static var previews: some View {
        QuizRow(quiz: quizModel.quizzes[0])
    }
}
