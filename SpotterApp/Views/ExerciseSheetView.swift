//
//  ExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI
import Charts

struct ExerciseSheetView: View {
    @Environment (\.managedObjectContext) var viewContext
    
    var exercise: FetchedResults<Exercise>.Element
    @State private var reps: Int64 = 0
    @State private var sets: Int64 = 0
    @State private var weight: Double = 0
    @State private var currentTab: String = "Weight"
    @State private var currentWeight: String = "100"
    
    @State private var weightDisplay = false
    @State private var weightConfirm = false
    
    @State private var repsDisplay = false
    @State private var repsConfirm = false
    var repsProxy: Binding<Double>{
        Binding<Double>(get: {
            return Double(reps)
        }, set: {
            reps = Int64($0)
        })
    }
    
    @State private var setsDisplay = false
    @State private var setsConfirm = false
    var setsProxy: Binding<Double>{
        Binding<Double>(get: {
            return Double(sets)
        }, set: {
            sets = Int64($0)
        })
    }
    
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
                                    if(weight != exercise.weight){
                                        weight = exercise.weight
                                    }
                                }

                        }
                        
                        if(weightDisplay){
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
                            
                            Stepper(
                                value: $weight,
                                in:0...1000,
                                step: stepFromString(currentWeight),
                                onEditingChanged: { editing in
                                    weightConfirm = true
                                    
                                    if(weight == exercise.weight){
                                        weightConfirm = false
                                    }
                                }
                            ){
                                Text("Adjust Weight")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            
                            // MARK: Adjust button style (maybe custom pill shape)
                            if(weightConfirm){
                                Button("Done"){
                                    DataController().editExercise(exercise: exercise, weight: weight, reps: reps, sets: sets, context: viewContext)
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
                        HStack{
                            Text("\(reps) reps")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .padding(.bottom)
                                .onTapGesture {
                                    repsDisplay.toggle()
                                    if(!repsDisplay){
                                        repsConfirm = false
                                    }
                                    
                                    if(reps != exercise.reps){
                                        reps = exercise.reps
                                    }
                                }
                        }
                        
                        if(repsDisplay){
                            Slider(
                                value: repsProxy,
                                in:0...20,
                                step: 1,
                                label: {
                                    Text("Reps")
                                },
                                minimumValueLabel: {
                                    Text("0")
                                },
                                maximumValueLabel: {
                                    Text("20")
                                },
                                onEditingChanged: { editing in
                                    repsConfirm = true
                                    
                                    if(reps ==  exercise.reps){
                                        repsConfirm = false
                                    }
                                }
                            )
                            
                            
                            if(repsConfirm){
                                Button("Done"){
                                    DataController().editExercise(exercise: exercise, weight: weight, reps: reps, sets: sets, context: viewContext)
                                    repsDisplay = false
                                    repsConfirm = false
                                }
                            }
                        }
                    }
                    .padding()
                    .onAppear{
                        reps = exercise.reps
                    }
                }
                
                // Sets section
                Section{
                    VStack(alignment: .leading){
                        Text("Sets")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        HStack{
                            Text("\(sets) sets")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "pencil")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                                .padding(.bottom)
                                .onTapGesture {
                                    setsDisplay.toggle()
                                    if(!setsDisplay){
                                        setsConfirm = false
                                    }
                                    
                                    if(sets != exercise.sets){
                                        sets = exercise.sets
                                    }
                                }
                        }
                        
                        if(setsDisplay){
                            Slider(
                                value: setsProxy,
                                in:0...10,
                                step: 1,
                                label:{
                                    Text("Sets")
                                },
                                minimumValueLabel: {
                                    Text("0")
                                        .foregroundColor(.secondary)
                                },
                                maximumValueLabel: {
                                    Text("10")
                                        .foregroundColor(.secondary)
                                },
                                onEditingChanged: { editing in
                                    setsConfirm = true
                                    
                                    if(sets == exercise.sets){
                                        setsConfirm = false
                                    }
                                }
                            )
                            
                            if(setsConfirm){
                                Button("Done"){
                                    DataController().editExercise(exercise: exercise, weight: weight, reps: reps, sets: sets, context: viewContext)
                                    setsDisplay = false
                                    setsConfirm = false
                                }
                            }
                        }
                    }
                    .padding()
                    .onAppear{
                        sets = exercise.sets
                    }
                }
                
                // Charts section
                // todo: update appearance, add picker
                Section{
                    VStack{
                        Picker("", selection: $currentTab.animation(.spring())){
                            Text("Weight")
                                .tag("Weight")
                            Text("Reps")
                                .tag("Reps")
                        }
                        .pickerStyle(.segmented)
                        .padding()
                        
                        Chart(exercise.information?.array as! [History], id:\.self){ history in
                            // MARK: switch() on $currentTab
                            switch currentTab{
                            case "Reps":
                                LineMark(
                                    x: .value("Date", "\(history.date!.getFormattedDate(format: "MMM d, yyyy"))"),
                                    y: .value("Weight", history.reps)
                                )
                                .foregroundStyle(.yellow.gradient)
                                
                                PointMark(
                                    x: .value("Date", "\(history.date!.getFormattedDate(format: "MMM d, yyyy"))"),
                                    y: .value("Weight", history.reps)
                                )
                                .foregroundStyle(.yellow.gradient)
                            default:
                                LineMark(
                                    x: .value("Date", "\(history.date!.getFormattedDate(format: "MMM d, yyyy"))"),
                                    y: .value("Weight", history.weight)
                                )
                                .foregroundStyle(Color("AccentColor").gradient)
                                
                                PointMark(
                                    x: .value("Date", "\(history.date!.getFormattedDate(format: "MMM d, yyyy"))"),
                                    y: .value("Weight", history.weight)
                                )
                                .foregroundStyle(Color("AccentColor").gradient)
                            }
                
                        }
                        .chartYAxisLabel(position: .trailing){
                            Text(currentTab == "Weight" ? "Weight (lbs)" : "Reps")
                                .foregroundColor(.primary)
                        }
                        .frame(height: 300)
                    }
    
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
