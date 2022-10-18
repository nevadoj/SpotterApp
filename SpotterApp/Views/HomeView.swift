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
    
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            NavigationView{
                ZStack{
                    ScrollView{
                        VStack{
                            ForEach(program) { program in
                                DisclosureGroup{
                                    if program.size > 0{
                                        ForEach(program.exercises!){ exercise in
                                            ExerciseItemView(exercise: exercise)
                                                .onTapGesture {
                                                    showExerciseDetails = true
                                                }.sheet(isPresented: $showExerciseDetails){
                                                    NavigationView{
                                                        ExerciseSheetView()
                                                            .navigationTitle(exercise.name!)
                                                    }
                                                    .presentationDetents([.medium])
                                                }
                                                .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                                    Button(role: .destructive){
                                                        Swift.print("Testing")
                                                    } label:{
                                                        Label("Delete2", systemImage: "trash")
                                                    }
                                                }
                                        }
                                    }
                                } label: {
                                    VStack(alignment: .leading){
                                        HStack{
                                            Text(program.name!)
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .padding(.vertical)
                                            HStack(alignment: .firstTextBaseline){
                                                Text("Working Sets: 12")
                                                    .font(.footnote)
                                                    .foregroundColor(.secondary)
                                                Text("Exercises: \(program.size)")
                                                    .font(.footnote)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                    }
                                    // Need to find method or re-design a way to edit programs (if a user is wrong the first time, they delete? -- push editing back)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                        Button{
                                            Swift.print("Deleting Program")
                                        } label:{
                                            Label("", systemImage: "trash")
                                        }
                                        .tint(.red)
                                    }
                                    .contextMenu{
                                        Button(role: .destructive){
                                            deleteProgram(program)
                                        } label: {
                                            Label("Delete Routine", systemImage: "trash")
                                        }
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green)
                                    .opacity(0.1)
                                )
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


