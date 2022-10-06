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
    
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            NavigationView{
                VStack{
                    List{
                        ForEach(program) { program in
                            DisclosureGroup{
                                // throws error atm because trying to access exercise children but is empty when program first created
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
                                    Text(program.name!)
                                        .font(.body)
                                        .fontWeight(.bold)
                                    HStack(alignment: .firstTextBaseline){
                                        Text("Working Sets: 12")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                        Text("Exercises: \(program.size)")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .contextMenu{
                                    Button(role: .destructive){
                                        deleteProgram(program)
                                    } label: {
                                        Label("Delete Routine", systemImage: "trash")
                                    }
                                    
                                    // contextMenu has its own view hierarchy
//                                    NavigationLink(){
//                                        AddExerciseView()
//                                            .navigationTitle("Add Exercise")
//                                    } label:{
//                                        Label("Add Exercise", systemImage:"plus")
//                                    }
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Programs")
                .toolbar{
                    ToolbarItem{
                        NavigationLink("Add"){
                            AddProgramView()
                                .navigationTitle("Add Program")
                        }
                    }
                }
            }
            
            Button{
                print("Add Button")
            } label:{
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:0)
            .padding()
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


