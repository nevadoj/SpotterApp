//
//  HomeView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var data : Routine
    @State var show = false
    
    var body: some View{
        NavigationView{
            VStack{
                List{
                    ForEach(data.programs) { program in
                        DisclosureGroup{
                            ForEach(program.exercises){ exercise in
                                HStack{
                                    Text(Image(systemName: "circlebadge"))
                                    VStack(alignment: .leading){
                                        Text(exercise.name)
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                        Text("Reps: \(exercise.reps)")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                .onTapGesture {
                                    show = true
                                }.sheet(isPresented: $show){
//                                    NavigationStack{
//                                        // Content: show/edit weight, reps, delete?
//                                        Text("sample")
//                                            .navigationTitle(exercise.name)
//                                    }
                                    NavigationView{
                                        ExerciseView(exercise: exercise)
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
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Routine())
    }
}


