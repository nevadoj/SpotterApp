//
//  AddExerciseView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-23.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment (\.managedObjectContext) var viewContext
    @Environment (\.dismiss) var dismiss
    
    var program: FetchedResults<Program>.Element
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

//struct AddExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddExerciseView()
//    }
//}
