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
    
    @State var addProgram = false
    @State private var exerciseDisplay: FetchedResults<Exercise>.Element?
    @State private var targetProgram: FetchedResults<Program>.Element?
    
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            NavigationView{
                ZStack{
                    VStack{
                        List{
                            ForEach(programs){ program in
                                DisclosureGroup{
                                    if program.size > 0{
                                        ForEach(program.exercises?.array as! [Exercise], id: \.self){ exercise in
                                            ExerciseItemView(exercise: exercise)
                                                .onTapGesture {
                                                    exerciseDisplay = exercise
                                                }
                                                .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                                    Button(){
                                                        DataController().deleteExercise(exercise: exercise, context: viewContext)
                                                    } label:{
                                                        Label("Delete2", systemImage: "trash")
                                                    }
                                                    .tint(.red)
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
                                    .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                        Button{
                                            Swift.print("\(program.name!)")
                                            Swift.print("\(program.id!)")
                                            targetProgram = program
                                        } label:{
                                            Label("", systemImage: "plus")
                                        }
                                        .tint(.green)
                                    }
                                    .contextMenu{
                                        Button(role: .destructive){
                                            deleteProgram(program)
                                        } label: {
                                            Label("Delete Routine", systemImage: "trash")
                                        }
                                        .tint(.red)
                                    }
                                }
                            } // end of ForEach
                        } // end of List
                        .navigationTitle("Programs")
                        .sheet(item: $exerciseDisplay){ exerciseDisplay in
                            NavigationView{
                                ExerciseSheetView(exercise: exerciseDisplay)
                                    .navigationTitle(exerciseDisplay.name!)
                            }
                            .presentationDetents([.medium, .large])
                        }
                        .sheet(item: $targetProgram){ targetProgram in
                            NavigationView{
                                AddExerciseView(program: targetProgram)
                                    .navigationTitle("Add to \(targetProgram.name ?? "Program")")
                            }
                            .presentationDetents([.medium])
                        }
                    }
                    VStack{
                        Spacer()
                        HStack {
                            Spacer()
                            PrimaryButton()
                                .onTapGesture {
                                    addProgram.toggle()
                                }
                                .sheet(isPresented: $addProgram){
                                    NavigationView{
                                        AddProgramView()
                                            .navigationTitle("Add Program")
                                    }
                                    .presentationDetents([.medium])
                                }
                        }
                    }
                }
            }
        }
    }
    
    private func deleteProgram(_ program: FetchedResults<Program>.Element){ // crashes the program if press "Add program" after deleting a program -- December 19, this crash doesnt happen
        withAnimation{
            viewContext.delete(program)
            DataController().save(context: viewContext)
        }
    }
}

// MARK: maybe charts section showing progress on all exercises per workout 

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


