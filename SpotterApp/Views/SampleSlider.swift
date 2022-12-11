//
//  SampleSlider.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-12-10.
//

import SwiftUI

struct SampleSlider: View {
    
    @State private var number: CGFloat = 10
    let min: CGFloat = 5
    let max: CGFloat = 20
    let step: CGFloat = 5
    
    var body: some View {
        VStack(spacing: 0){
            Text("\(number, specifier: "%.2f")")
            
            Slider(
                value: $number,
                in: min...max,
                step: step
            )
            
            HStack(spacing: 0){
                let count: Int = Int((max / step))
                
                ForEach(0..<count){ index in
                    VStack{
                        Text("I")
                        Text("\(index * Int(step) + Int(min))")
                    }
                    .offset(x:
                                index == 1 ? 5 :
                                index == 2 ? 4 :
                                0
                    )
                    if index != (count - 1){
                        Spacer()
                    }
                }
            }
        }
    }
}

struct SampleSlider_Previews: PreviewProvider {
    static var previews: some View {
        SampleSlider()
    }
}
