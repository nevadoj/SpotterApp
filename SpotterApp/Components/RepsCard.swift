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
            HStack {
                Text("Reps:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
                Text("\(num) reps")
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

struct RepsCard_Previews: PreviewProvider {
    static var previews: some View {
        RepsCard(num: 5)
    }
}
