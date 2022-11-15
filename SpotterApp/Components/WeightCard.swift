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
            VStack {
                Text("Weight")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding()
                Text("\(num, specifier: "%.1f") lbs")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
            }
        }
        .frame(height: UIScreen.main.bounds.height / 7)
        .frame(maxWidth: UIScreen.main.bounds.width / 3)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.5), radius: 8, x:7, y:8)
        )
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
    }
}

struct WeightCard_Previews: PreviewProvider {
    static var previews: some View {
        WeightCard(num: 150)
    }
}
