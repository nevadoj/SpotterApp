//
//  TitlePanel.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-10-17.
//

import SwiftUI

struct TitlePanel: View {
    var body: some View {
        HStack(spacing: 20){
            VStack(alignment: .leading){
                Text("Programs")
                    .font(.largeTitle).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
        }
        .padding()
        .background(Color("Background"))
    }
}

struct TitlePanel_Previews: PreviewProvider {
    static var previews: some View {
        TitlePanel()
            .background(Color("Background"))
    }
}
