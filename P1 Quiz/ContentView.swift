//
//  ContentView.swift
//  P1 Quiz
//
//  Created by Jaime on 10/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var quizModel: QuizModel
    
    @EnvironmentObject var scoreModel: ScoreModel
    
    @State var showAll: Bool = true
    
    var body: some View {
        NavigationView {
        List(){
            VStack{
                Toggle(isOn: $showAll){
                    Label("Ver todo", systemImage: "list.bullet")
                }
                Text("Puntos = \(scoreModel.acertadas.count)")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            ForEach(quizModel.quizzes.indices, id: \.self){ i in
                if showAll || !scoreModel.acertado(quizModel.quizzes[i]){
                    NavigationLink(
                        destination: QuizDetail(quiz: $quizModel.quizzes[i])) {
                        QuizRow(quiz: quizModel.quizzes[i])
                    }
                }
            }
        }
        .navigationTitle(Text("P1 Quiz"))
        .navigationBarItems(leading: Button(action: {scoreModel.limpiar()},
                                            label: {Image(systemName: "flame.fill")}), trailing: Button(action: {quizModel.load()},
                                                                                                        label: {Image(systemName: "arrow.clockwise")}))
        
            VStack {
                Spacer()
                Image("none")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                Spacer()
                Text("Desliza hacia la izquierda")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let quizModel: QuizModel = {
        let qm = QuizModel()
        qm.loadExamples()
        return qm
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(quizModel)
    }
}
