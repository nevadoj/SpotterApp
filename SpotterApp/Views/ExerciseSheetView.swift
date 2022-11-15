//
//  ExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct ExerciseSheetView: View {
    
    var exercise: FetchedResults<Exercise>.Element
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                WeightCard(num: exercise.weight)
                    .onTapGesture {
                        Swift.print("Testing")
                }
                RepsCard(num: exercise.reps)
                SetsCard(num: exercise.sets)

                
            }
            // add charts here
            Text("Historical")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
    }
}

//struct ExerciseSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseSheetView()
//    }
//}


