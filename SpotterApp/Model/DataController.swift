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
    
    func addExercise(name: String, weight: Double, reps: Int64, context: NSManagedObjectContext){
        let newExercise = Exercise(context: context)
        newExercise.id = UUID()
        newExercise.name = name
        newExercise.weight = weight
        newExercise.reps = reps
        
        save(context: context)
    }
}
