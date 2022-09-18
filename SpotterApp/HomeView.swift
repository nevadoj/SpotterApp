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
                                .swipeActions(edge: .trailing, allowsFullSwipe: false){
                                    Button(role: .destructive){
                                        print("Testing")
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
                        }
                    }
                    
                    Text("Sample")
                        .font(.title)
                        .onLongPressGesture(minimumDuration: 1){
                            print("Testing")
                            let impact = UIImpactFeedbackGenerator(style: .medium)
                            impact.impactOccurred()
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


