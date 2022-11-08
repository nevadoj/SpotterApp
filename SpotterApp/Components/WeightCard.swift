//
//  ExerciseDetails.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-11-06.
//

import SwiftUI

struct WeightCard: View {
    @State var num: Double
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("Weight:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                Text("\(num, specifier: "%.1f") lbs")
                    .font(.title2)
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
        .padding(.horizontal, 25)
        .padding(.vertical, 5)
    }
}

struct WeightCard_Previews: PreviewProvider {
    static var previews: some View {
        WeightCard(num: 150)
    }
}
