//
//  AddRoutineView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct AddProgramView: View {
    @Environment (\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    @State private var programName = ""
    @State private var showButton = false
    
    var body: some View {
        VStack(alignment: .leading){
            Form{
                Section("Program Name"){
                    TextField("Program Name", text: $programName)
                        .onChange(of: programName){ programName in
                            showButton = true
                            if(programName.isEmpty){
                                showButton = false
                            }
                        }
                }
                if(showButton){
                    Button("Done"){
                        DataController().addProgram(name: programName, context: viewContext)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddProgramView_Previews: PreviewProvider {
    static var previews: some View {
        AddProgramView()
    }
}
