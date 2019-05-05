//
//  CoreDataHandler.swift
//  Student Data
//
//  Created by AnDy on 5/1/19.
//  Copyright © 2019 AnDy. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataHandler {
    
    static let instance = CoreDataHandler()
    
    //MARK:- Get object from core data
    private func getObjectFromCoreData() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    //MARK:- Store data into core data
    func storeIntoCoreData(student : [String : Any]){
        
        let context = getObjectFromCoreData()
        
        let student1 = StudentData(context: context)
        student1.name = student["name"] as? String
        student1.age = student["age"] as? String
        student1.phoneNumber = student["phoneNumber"] as? String
        student1.dob = student["dob"] as? Date
        student1.favSubject = student["favSubject"] as? String
        
        
        do{
            try context.save()
        }catch(let error){
            print("Error Occurred \(error)")
        }
    }
    
    
    
    //MARK:- Get items from core data
    func getItemsFromCoreData() -> [StudentData]? {
        
        let context = getObjectFromCoreData()
        
        var students : [StudentData]?
        
        do{
            students = try context.fetch(StudentData.fetchRequest()) as! [StudentData]
        }catch(let error){
            print("Error Occurred \(error)")
        }
        return students
    }
    
    
    //MARK:- Search for items from core data
    func searcForItemInCoreData(studentName : String) -> [StudentData]? {
        
        let context = getObjectFromCoreData()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentData")
        request.predicate = NSPredicate(format: "name CONTAINS %@", studentName)
        
        var students : [StudentData]?
        do{
            students = try context.fetch(request) as! [StudentData]
        }catch(let error){
            print("Error Occurred \(error)")
        }
        return students
    }
    
    
    
    //MARK:- Search for items from core data
    func deleteItemsFromCoreData(student : StudentData) -> [StudentData]? {
        
        let context = getObjectFromCoreData()
        
        context.delete(student)
        
        do{
            try context.save()
        }catch(let error){
            print("Error Occurred \(error)")
        }
        
        return getItemsFromCoreData()
    }
    
    
}
