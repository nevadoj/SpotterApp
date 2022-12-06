//
//  EmptyCanvas.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-12-04.
//

// nested sheetview inside of exerciseSheetView needs a binding variable that holds weight, sets, reps etc 


import SwiftUI

struct EmptyCanvas: View {
    var body: some View {
        NavigationStack{
            List{
                Section{
                    VStack(alignment: .leading){
                        Text("Weight")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        Text("250 lbs")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding()
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
