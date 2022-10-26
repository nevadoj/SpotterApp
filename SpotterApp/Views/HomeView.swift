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
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var programs: FetchedResults<Program>
    
    @State var showExerciseDetails = false
    @State var editProgramDetails = false
    @State var addExercise = false
    @State private var exerciseDisplay: FetchedResults<Exercise>.Element?
    
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            NavigationView{
                ZStack{
                    VStack{
                        List{
                            ForEach(programs){ program in
                                DisclosureGroup{
                                    if program.size > 0{
                                        //Array(program.exercises as? Set<Exercise> ?? [])
                                        ForEach(program.exercises?.array as! [Exercise], id: \.self){ exercise in
                                            ExerciseItemView(exercise: exercise)
                                                .onTapGesture {
                                                    exerciseDisplay = exercise
//                                                    showExerciseDetails.toggle()
                                                }
                                                .sheet(item: $exerciseDisplay){ exerciseDisplay in
                                                    NavigationView{
                                                        ExerciseSheetView()  // Add function works now? -- need to fix sheet view displaying correct exercise
                                                            .navigationTitle(exerciseDisplay.name!)
                                                    }
                                                    .presentationDetents([.medium, .large])
                                                }
                                                .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                                    Button(){
                                                        Swift.print(exercise.name!) // need to add function deleteExercise
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
                                            Swift.print("\(program.name!)")
                                            Swift.print("\(program.id!)")
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
                        } // end of List
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


