//
//  EditWeightView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-12-09.
//

import SwiftUI

struct EditWeightView: View {
    
//    @Binding var weight: Double
    @Environment(\.dismiss) var dismiss
    
    @State private var weightAdjust: Double = 0
    @State private var showButton = false
    
    let sample: Double = 0
    
    var body: some View {
        VStack {
            Text("\(weightAdjust, specifier: "%.2f") lbs")
                .font(.title3)
                .fontWeight(.bold)
            Slider(
                value: $weightAdjust,
                in:0...300,
                step: 0.25,
                onEditingChanged: { editing in
                    showButton = true
                    
                    if(weightAdjust == sample){
                        showButton = false
                    }
                }
            )
            .frame(maxWidth: UIScreen.main.bounds.width / 1.5)
                
            if(showButton){
                Button("Done"){
                    // call save 
                    dismiss()
                }
            }
        }
    }
}

struct EditWeightView_Previews: PreviewProvider {
    static var previews: some View {
        EditWeightView()
    }
}
