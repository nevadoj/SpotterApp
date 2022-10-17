//
//  HomeViewAlternate.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-10-17.
//

import SwiftUI

struct HomeViewAlternate: View {
    var body: some View {
        VStack{
            DisclosureGroup("Sample"){
                Text("Sample text for disclosure group")
            }
            .accentColor(.green)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .opacity(0.1)
            )
        }
    }
}

struct HomeViewAlternate_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAlternate()
    }
}
