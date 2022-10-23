//
//  HomeView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var program: FetchedResults<Program>

    @State var showExerciseDetails = false
    @State var editProgramDetails = false
    @State var addExercise = false
    
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            NavigationView{
                ZStack{
                    VStack{
                        List{
                            ForEach(program) { program in
                                DisclosureGroup{
                                    if program.size > 0{
//                                        Array(program.exercises as? Set<Exercise> ?? [])
                                        ForEach(program.exercises?.array as! [Exercise], id: \.self){ exercise in
                                            ExerciseItemView(exercise: exercise)
                                                .onTapGesture {
                                                    showExerciseDetails = true
                                                }.sheet(isPresented: $showExerciseDetails){
                                                    NavigationView{
                                                        ExerciseSheetView()
                                                            .navigationTitle(exercise.name!)
                                                    }
                                                    .presentationDetents([.medium, .large])
                                                }
                                                .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                                    Button(role: .destructive){
                                                        Swift.print("Testing") // need to add function deleteExercise
                                                    } label:{
                                                        Label("Delete2", systemImage: "trash")
                                                    }
                                                }
                                        }
                                    }
                                    else{
                                        withAnimation{                                        
                                            HStack{
                                                VStack(alignment: .leading){
                                                    Text("No exercises added")
                                                        .font(.callout)
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    VStack(alignment: .leading){
                                        Text(program.name!)
                                            .font(.body)
                                            .fontWeight(.bold)
                                            .padding(.vertical)
                                        HStack(alignment: .firstTextBaseline){
                                            Text("Working Sets: \(program.working_sets)")
                                                .font(.footnote)
                                                .foregroundColor(.secondary)
                                            Text("Exercises: \(program.size)")
                                                .font(.footnote)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    // Need to find method or re-design a way to edit programs (if a user is wrong the first time, they delete? -- push editing back)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                        Button{
                                            Swift.print("Add exercise")
                                            addExercise.toggle()
                                        } label:{
                                            Label("", systemImage: "plus")
                                        }
                                        .tint(.green)
                                    }
                                    .sheet(isPresented: $addExercise){
                                        NavigationView{
                                            AddExerciseView(program: program)
                                                .navigationTitle("Add Exercise")
                                        }
                                        .presentationDetents([.medium])
                                    }
                                    .contextMenu{
                                        Button(role: .destructive){
                                            deleteProgram(program)
                                        } label: {
                                            Label("Delete Routine", systemImage: "trash")
                                        }
                                    }
                                }
                            }
                        }
                        .navigationTitle("Programs")
                        
                    }
                    
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink{
                                AddProgramView()
                                    .navigationTitle("Add Program")
                            } label: {
                                PrimaryButton()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func deleteProgram(_ program: FetchedResults<Program>.Element){
        withAnimation{
            viewContext.delete(program)
            DataController().save(context: viewContext)
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


