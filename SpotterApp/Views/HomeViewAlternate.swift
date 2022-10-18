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
            TitlePanel()
            ScrollView{
                
            }
            .padding(.top, 10)
            .background(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
        }
        .background(Color("Background"))
    }
}

struct HomeViewAlternate_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAlternate()
    }
}
