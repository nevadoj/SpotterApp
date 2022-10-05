//
//  SampleView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-22.
//

import SwiftUI

struct ExerciseItemView: View {
    @Environment(\.managedObjectContext) var viewContext
    @Environment(\.dismiss) var dismiss
    
    var exercise: FetchedResults<Exercise>.Element
    
    var body: some View {
        HStack{
            Text(Image(systemName: "circlebadge"))
            VStack(alignment: .leading){
                Text(exercise.name!)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text("Reps: \(exercise.reps)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
    }
}
