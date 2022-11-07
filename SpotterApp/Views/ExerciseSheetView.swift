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
            HStack {
                Text("Weight")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                Text("150 lbs") // on tap - slider which allows user to edit weight
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
            }
        }
        .frame(height: UIScreen.main.bounds.height / 9)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.5), radius: 8, x:7, y:8)
        )
        .padding()
    }
}

struct ExerciseSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSheetView()
    }
}


