//
//  HomeView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var data : Routine
    @State var showExerciseDetails = false
    
    var body: some View{
        ZStack(alignment: .bottomTrailing){
            NavigationView{
                VStack{
                    List{
                        ForEach(data.programs) { program in
                            DisclosureGroup{
                                ForEach(program.exercises){ exercise in
                                    ExerciseItemView(exercise: exercise)
                                    .onTapGesture {
                                        showExerciseDetails = true
                                    }.sheet(isPresented: $showExerciseDetails){
                                        NavigationView{
                                            ExerciseSheetView(exercise: exercise)
                                                .navigationTitle(exercise.name)
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
                            } label: {
                                VStack(alignment: .leading){
                                    Text(program.name)
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
                                        data.deleteProgram(program)
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
                .navigationTitle("Routines")
                .toolbar{
                    ToolbarItem{
                        NavigationLink("Add"){
                            AddRoutineView()
                                .navigationTitle("Add Routine")
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Routine())
    }
}


