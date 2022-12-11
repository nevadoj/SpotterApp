//
//  ExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI
import Charts

struct ExerciseSheetView: View {
    
    var exercise: FetchedResults<Exercise>.Element
    @State private var reps: Int64 = 0
    @State private var sets: Int64 = 0
    @State private var weight: Double = 0
    
    @State private var weightDisplay = false
    @State private var weightConfirm = false
    
    var body: some View {
        NavigationStack{
            List{
                // Weight section
                Section{
                    VStack(alignment: .leading){
                        Text("Weight")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        HStack{
                            Text("\(weight, specifier: "%.2f") lbs")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .padding(.bottom)
                                .onTapGesture {
                                    weightDisplay.toggle()
                                    if(!weightDisplay){
                                        weightConfirm = false
                                    }
                                }

                        }
                        
                        if(weightDisplay){
                            Slider(
                                value: $weight,
                                in:0...300,
                                step: 0.25,
                                onEditingChanged: { editing in
                                    weightConfirm = true
                                    
                                    if(weight == exercise.weight){
                                        weightConfirm = false
                                    }
                                }
                            )
                            
                            if(weightConfirm){
                                Button("Done"){
                                    weightDisplay = false
                                    weightConfirm = false
                                }
                            }
                        }
                    }
                    .padding()
                } header: {
                    Text("Details")
                }
                .headerProminence(.increased)
                .onAppear{
                    weight = exercise.weight
                }
                
                // Reps section
                Section{
                    VStack(alignment: .leading){
                        Text("Reps")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        Text("\(exercise.reps) reps")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding()
                }
                
                // Sets section
                Section{
                    VStack(alignment: .leading){
                        Text("Sets")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        Text("\(exercise.sets) sets")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding()
                }
                
                // Charts section
                Section{
                    Chart(exercise.information?.array as! [History], id:\.self){ history in
                        LineMark(
                            x: .value("Date", "\(history.date!.getFormattedDate(format: "MMMM yyyy"))"),
                            y: .value("Weight", history.weight)
                        )
                    }
                    .frame(height: 300)
                } header: {
                    Text("Historical")
                }
                .headerProminence(.increased)
            }
            
            
        }
    }
}

//struct ExerciseSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseSheetView()
//    }
//}
