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
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
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
    
    func addHistory(exercise: Exercise, weight: Double, reps: Int64, date: Date, context: NSManagedObjectContext){
        
        let newHistory = History(context: context)
        newHistory.weight = weight
        newHistory.reps = reps
        let createdAt = Date()
        newHistory.date = createdAt
        newHistory.exercise = exercise
        
        save(context: context)
    }
    
    func deleteHistory(history: History, context: NSManagedObjectContext){
        context.delete(history)
        save(context: context)
    }
    
    func addExercise(name: String, weight: Double, reps: Int64, sets: Int64, program: Program, context: NSManagedObjectContext){
        let newExercise = Exercise(context: context)
        newExercise.id = UUID()
        newExercise.name = name
        newExercise.weight = weight
        newExercise.reps = reps
        newExercise.sets = sets
        newExercise.program = program
        
        program.size += 1
        program.working_sets += sets
        
        // Attach information for charts
        let createdAt = Date()
        addHistory(exercise: newExercise, weight: weight, reps: reps, date: createdAt, context: context)

        save(context: context)
    }
    
    
    // might need to separate this function because this will make a history entry when changing reps/sets/name
    func editExercise(exercise: Exercise, weight: Double, reps: Int64, sets: Int64, context: NSManagedObjectContext){
        exercise.weight = weight
        exercise.reps = reps
        exercise.sets = sets
        
        let updatedAt = Date()
        let topDate = exercise.information?.array.last as! History
        
        if(topDate.date!.getFormattedDate(format: "MMM dd, yyyy") == updatedAt.getFormattedDate(format: "MMM dd, yyyy")){
            // insert at array.top() index
            deleteHistory(history: topDate, context: context)
        }
        
        addHistory(exercise: exercise, weight: weight, reps: reps, date: updatedAt, context: context)
        
        save(context: context)
    }
    
    // todo: deleteExercise
    
    func addProgram(name: String, context: NSManagedObjectContext){
        let newProgram = Program(context: context)
        newProgram.name = name
        newProgram.id = UUID()
        newProgram.size = 0
        newProgram.working_sets = 0
        newProgram.date = Date()
        
        save(context: context)
    }
    
    func editProgram(program: Program, name: String, context: NSManagedObjectContext){
        program.name = name
        
        save(context: context)
    }
}
