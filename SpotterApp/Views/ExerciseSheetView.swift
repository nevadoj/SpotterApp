//
//  ExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

// Reference swift playgrounds for sending data across views
// Want to create a view that takes in input and formats the display


import SwiftUI

struct ExerciseSheetView: View {
    
//    var exercise: FetchedResults<Exercise>.Element
    
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                WeightCard(num: 150)
                    .onTapGesture {
                        Swift.print("Testing")
                }
                RepsCard(num: 5)
                
                // add SwiftCharts here
                Spacer()
            }
        }
    }
}

struct ExerciseSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSheetView()
    }
}


