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
    
    @State private var currentWeight: String = "100"
    
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
                    VStack(alignment: .leading){ // maybe separate this into a different file
                        Picker("", selection: $currentWeight){
                            Text("100")
                                .tag("100")
                            Text("10")
                                .tag("10")
                            Text("5")
                                .tag("5")
                            Text("0.25")
                                .tag("0.25")
                        }
                        .pickerStyle(.segmented)
                        .padding(.top)
                        
                        Stepper(
                            value: $weight,
                            in:0...1000,
                            step: stepFromString(currentWeight)
                        ){
                            Text("\(weight, specifier: "%.2f") lbs")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .padding()
                    }
                }
                
                Section("Reps"){
                    Stepper("\(reps)", value: $reps, in:0...100)
                        .padding()
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Section("Sets"){
                    Stepper("\(sets)", value: $sets, in:0...100)
                        .padding()
                        .font(.title3)
                        .fontWeight(.semibold)
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
