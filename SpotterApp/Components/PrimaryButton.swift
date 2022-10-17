//
//  PrimaryButton.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-10-17.
//

import SwiftUI

struct PrimaryButton: View {
    var body: some View {
        Image(systemName: "plus")
            .resizable()
            .frame(width: 28, height: 28)
            .padding()
            .background(Color("AccentColor"))
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:0)
            .padding()
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton()
    }
}
