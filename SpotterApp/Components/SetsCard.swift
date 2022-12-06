//
//  SetsCard.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-11-15.
//

import SwiftUI

struct SetsCard: View {
    @State var num: Int64
    var body: some View {
        VStack(alignment: .leading){
            VStack {
                Text("Sets")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .padding()
                Text("\(num) sets")
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

struct SetsCard_Previews: PreviewProvider {
    static var previews: some View {
        SetsCard(num: 4)
    }
}
