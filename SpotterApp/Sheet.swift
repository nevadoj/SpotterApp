//
//  Sheet.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-16.
//

import SwiftUI

struct Sheet: View {
    @State private var sheetShown = false
    @State private var query = ""
    
    var body: some View {
        Button("Display bottom sheet"){
            sheetShown = true
        }
        .sheet(isPresented: $sheetShown){
            NavigationStack{
                Text("You query: \(query)")
                    .searchable(text: $query)
                    .navigationTitle("Search")
            }
            .presentationDetents([.medium])
        }
    }
}

struct Sheet_Previews: PreviewProvider {
    static var previews: some View {
        Sheet()
    }
}
