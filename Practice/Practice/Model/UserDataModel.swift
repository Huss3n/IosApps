//
//  UserDataModel.swift
//  Practice
//
//  Created by Muktar Hussein on 27/10/2023.
//

import Foundation
import CoreData

class UserDataModel: ObservableObject {
    
    let container = NSPersistentContainer(name: "Userdata")
    
    init() {
        container.loadPersistentStores { description, error in
            if let err = error {
                print("Error loading coredata: \(err.localizedDescription)")
            }
        }
    }
    
}
