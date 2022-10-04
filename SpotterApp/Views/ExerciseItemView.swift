//
//  SampleView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-22.
//

import SwiftUI

struct ExerciseItemView: View {
    
    var exercise: Exercise
    
    var body: some View {
        HStack{
            Text(Image(systemName: "circlebadge"))
            VStack(alignment: .leading){
                Text(exercise.name)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text("Reps: \(exercise.reps)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ExerciseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseItemView(exercise: Exercise(name: "Bench Press", weight: 145, reps: 5))
    }
}
