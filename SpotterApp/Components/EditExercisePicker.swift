//
//  EditExercisePicker.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-11-20.
//

import SwiftUI

struct EditExercisePicker: View {
    
    @State var weightSelection: Int64 = 0
    @State var stepSelection: Double = 0
    
    @State private var selection: Double? = 0
    
    let options = Array(stride(from: 0.0, through: 250.0, by: 0.25))
    
    var body: some View {
//        GeometryReader{ geometry in
//            HStack{
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//
//                // step = Double array = [0, 0.25, 0.50, 0.75]
//                // weight = double/int array = [Int](0..<300)
//            }
//        }
//        VStack {
//            Text("Current Number: \(indexSelection)")
//            ScrollView(.horizontal, showsIndicators: false){
//                HStack{
//                    ForEach(1...100, id: \.self){ i in
//                        Text("\(i)")
//                            .foregroundColor(indexSelection == i ? .red : .black)
//                            .frame(width: 20, height: 20)
//                            .gesture(TapGesture().onEnded({ indexSelection = i }))
//                    }
//                }
//            }
//        }
        
        PomodoroPicker(
            selection: $selection,
            options: options,
            onChange: { value in
                print("Value changed to \(value ?? 0.0)")
            }) { option in
                Text("\(option, specifier: "%.2f") lbs")
                    .fontWeight(selection == option ? .bold: .regular)
            }
    }
}

struct EditExercisePicker_Previews: PreviewProvider {
    static var previews: some View {
        EditExercisePicker()
    }
}
