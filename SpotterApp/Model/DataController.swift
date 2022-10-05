//
//  DataController.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-10-04.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "WorkoutModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error{
                fatalError("Failed to load the data \(error)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
        } catch{
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
    
    func addExercise(name: String, weight: Double, reps: Int64, program: Program, context: NSManagedObjectContext){
        let newExercise = Exercise(context: context)
        newExercise.id = UUID()
        newExercise.name = name
        newExercise.weight = weight
        newExercise.reps = reps
        
        program.exercises?.append(newExercise)
        
        save(context: context)
    }
    
    func editExercise(exercise: Exercise, name: String, weight: Double, reps: Int64, context: NSManagedObjectContext){
        exercise.name = name
        exercise.weight = weight
        exercise.reps = reps
        
        save(context: context)
    }
    
    func addProgram(name: String, context: NSManagedObjectContext){
        let newProgram = Program(context: context)
        newProgram.name = name
        
        save(context: context)
    }
    
    func editProgram(program: Program, name: String, context: NSManagedObjectContext){
        program.name = name
        
        save(context: context)
    }
}
