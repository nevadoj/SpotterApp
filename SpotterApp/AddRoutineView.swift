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
    
    @State var routineName: String = ""
    @State var newProgram = Program()
    @State var newExercise = Exercise(name: "Bench Press", weight: 125, reps: 5)
    @State var showButton = false
    
    var body: some View {
        VStack(alignment: .leading){
            Form{
                Section("Routine Name"){
                    TextField("Routine Name", text: $routineName)
                        .onChange(of: routineName){ routineName in
                            showButton = true
                            if(routineName.isEmpty){
                                showButton = false
                            }
                            newProgram.name = routineName
                        }
                }
                if(showButton){
                    Button("Done"){
                        data.addExercise(newProgram, newExercise)
                        data.addProgram(newProgram)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView()
    }
}
