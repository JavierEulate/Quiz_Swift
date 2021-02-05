//
//  ImageView.swift
//  Mi P1 Quiz
//
//  Created by JavierMac on 16/10/2020.
//

import SwiftUI

struct ImageView: View {
    
    @EnvironmentObject var imageStore: ImageStore
    
    var quiz: QuizItem
    
    var body: some View {
        Image(uiImage: imageStore.image(url: quiz.attachment?.url))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .animation(.easeInOut)
            .padding()
    }
}

struct ImageView_Previews: PreviewProvider {
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
