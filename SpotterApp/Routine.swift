//
//  Routine.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-14.
//

import SwiftUI

struct Exercise : Identifiable, Codable{
    var name = "placeholder"
    var weight = 0.0
    var reps = 0
    var id = UUID()
}


class Program : Identifiable, Codable{
    // Program details
    var name = ""
    
    // Exercises in program
    var exercises = [Exercise]()
    
    var size: Int{
        exercises.count
    }
    
}


@MainActor class Routine : ObservableObject {
    @Published private(set) var programs : [Program]
    let saveKey = "SavedData"
    
    init(){
        // Load saved data
        if let data = UserDefaults.standard.data(forKey: saveKey){
            if let decoded = try? JSONDecoder().decode([Program].self, from: data){
                programs = decoded
                return
            }
        }
        // No saved data
        programs = []
    }
    
    
    private func save(){
        if let encoded = try? JSONEncoder().encode(programs){
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    func add(_ program : Program){
        programs.append(program)
        save()
    }
    
    func delete(_ program: Program){
        // programs.remove
    }
    
    func findProgam(_ program: Program){
        // return program from program list where program matches UUID
    }
    
    func addExercise(_ program : Program, _ exercise : Exercise){
        program.exercises.append(exercise)
        save()
    }
}
