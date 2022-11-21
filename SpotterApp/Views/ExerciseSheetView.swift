//
//  ExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct ExerciseSheetView: View {
    
    var exercise: FetchedResults<Exercise>.Element
    @State private var reps: Int64 = 0
    @State private var sets: Int64 = 0
    @State private var weight: Double = 0
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                WeightCard(num: exercise.weight)
                    .onTapGesture {
                        Swift.print("Testing")
                    }
                    .onAppear{
                        weight = exercise.weight
                    }
                RepsCard(num: exercise.reps)
                    .onAppear{
                        reps = exercise.reps
                    }
                SetsCard(num: exercise.sets)
                    .onAppear{
                        sets = exercise.sets
                    }

                
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


