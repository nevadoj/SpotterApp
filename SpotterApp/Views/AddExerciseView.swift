//
//  AddExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-23.
//

import SwiftUI

// input for exercise name, weight, reps
// name - nonempty
// weight & reps -> non negative

struct AddExerciseView: View {
    @Environment (\.managedObjectContext) var viewContext
    @Environment (\.dismiss) var dismiss
    
    var program: FetchedResults<Program>.Element
    
    @State private var exerciseName = ""
    @State private var sets: Int64 = 0
    @State private var reps: Int64 = 0
    @State private var weight: Double = 0
    @State private var showButton = false
    
    var body: some View {
        VStack(alignment: .leading){
            Form{
                Section("Exercise Name"){
                    TextField("Exercise Name", text: $exerciseName)
                        .onChange(of: exerciseName){ exerciseName in
                            showButton = true
                            if(exerciseName.isEmpty){
                                showButton = false
                            }
                        }
                }
                
                Section("Weight"){
                    Text("\(weight, specifier: "%.1f") lbs")
                    Slider(value: $weight, in:0...500, step: 0.5)
                }
                Section("Reps"){
                    Stepper("\(reps)", value: $reps, in:0...100)
                }
                Section("Sets"){
                    Stepper("\(sets)", value: $sets, in:0...100)
                }
                
                if(showButton){
                    Button("Done"){
                        Swift.print("Adding to: \(program.name!)")
                        DataController().addExercise(name: exerciseName, weight: weight, reps: reps, sets: sets, program: program, context: viewContext)
                        dismiss()
                    }
                }
            }
        }
    }
}

//struct AddExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddExerciseView()
//    }
//}
