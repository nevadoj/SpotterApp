//
//  RepsCard.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-11-07.
//

import SwiftUI

struct RepsCard: View {
    @State var num: Int64
    
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                Text("Reps")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding()
                Text("\(num) reps")
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
                .shadow(color: .gray.opacity(0.5), radius: 8, x:3, y:6)
        )
        .padding(.horizontal, 5)
        .padding(.vertical, 10)
    }
}

struct RepsCard_Previews: PreviewProvider {
    static var previews: some View {
        RepsCard(num: 5)
    }
}
