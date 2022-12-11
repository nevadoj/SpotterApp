//
//  EmptyCanvas.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-12-04.
//

// nested sheetview inside of exerciseSheetView needs a binding variable that holds weight, sets, reps etc 


import SwiftUI

struct EmptyCanvas: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var weightAdjust: Double = 0
    @State private var showButton = false
    @State private var showWeight = false
    
    let sample: Double = 0
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Weight")
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                            Text("\(weightAdjust, specifier: "%.2f") lbs")
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            if(showWeight){
                                Slider(
                                    value: $weightAdjust,
                                    in:0...300,
                                    step: 0.25,
                                    onEditingChanged: { editing in
                                        showButton = true
                                        
                                        if(weightAdjust == sample){
                                            showButton = false
                                        }
                                    }
                                )
                                .frame(maxWidth: UIScreen.main.bounds.width / 1)
                                
                                
                                if(showButton){
                                    Button("Done"){
                                        showButton = false
                                        showWeight = false
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        Spacer()
                        Image(systemName: "pencil")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                            .padding()
                            .onTapGesture {
                                showWeight.toggle()
                                if(!showWeight){
                                    showButton = false
                                }
                            }
                    }
                } header: {
                    Text("Details")
                }
                .headerProminence(.increased)
            
                Section{
                    NavigationLink(destination: ProfileView()){
                        VStack(alignment: .leading){
                            Text("Sample")
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                            Text("Other")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                }
                
                
                Section{
                    VStack(alignment: .leading){
                        Text("Reps")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        Text("6 reps")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding()
                }
                
                Section{
                    VStack(alignment: .leading){
                        Text("Sets")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        Text("4 reps")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding()
                }
                
                Section("Historical"){
                    Text("Other section")
                }
                .headerProminence(.increased)
            }
            .navigationTitle("Bench Press")
        }
    }
}

struct EmptyCanvas_Previews: PreviewProvider {
    static var previews: some View {
        EmptyCanvas()
            .navigationTitle("Bench Press")
    }
}
