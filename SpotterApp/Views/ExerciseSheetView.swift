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
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){  // wrap in scrollview?
                ScrollView(.horizontal, content:{
                    HStack {
                        WeightCard(num: exercise.weight)
                            .onTapGesture {
                                Swift.print("Testing")
                            }
                            .onAppear{
                                weight = exercise.weight
                            }
                        //                        RepsCard(num: exercise.reps)
                        //                            .onAppear{
                        //                                reps = exercise.reps
                        //                            }
                        //                        SetsCard(num: exercise.sets)
                        //                            .onAppear{
                        //                                sets = exercise.sets
                        //                            }
                    }
                })
                .padding()
                
                // add charts here
                Text("Historical")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                Chart(exercise.information?.array as! [History], id:\.self){ history in
                    LineMark(
                        x: .value("Date", "\(history.date!.getFormattedDate(format: "MMMM yyyy"))"),
                        y: .value("Weight", history.weight)
                    )
                }
                .frame(height: 200)
                Spacer()
            }
        }
    }
}

//struct ExerciseSheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseSheetView()
//    }
//}


