//
//  AddRoutineView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct AddRoutineView: View {
    @EnvironmentObject var data : Routine
    @Environment(\.dismiss) var dismiss
    
    @State var newRoutine = Program()
    @State var newExercise = Exercise(name: "Bench Press", weight: 125, reps: 5)
    
    var body: some View {
        VStack(alignment: .leading){
            Form{
                Section("Routine Name"){
                    TextField("Routine Name", text: $newRoutine.name)
                }
            }
            
            Button("Done"){
                data.addExercise(newRoutine, newExercise)
                data.add(newRoutine)
                dismiss()
            }
            
        }
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView()
    }
}
