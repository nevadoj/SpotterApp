//
//  ExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

// Reference swift playgrounds for sending data across views
// Want to create a view that takes in input and formats the display


import SwiftUI

struct ExerciseView: View {
    var exercise : Exercise
    
    var body: some View {
        Text("Hello World!")
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercise: Exercise(name: "Bench Press", weight: 145, reps: 8))
    }
}


