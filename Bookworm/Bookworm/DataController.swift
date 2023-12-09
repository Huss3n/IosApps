//
//  DataController.swift
//  Bookworm
//
//  Created by Muktar Hussein on 26/10/2023.
//

import Foundation
import CoreData


final class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores { description, error in
            if let err = error {
                print("Error loading core data \(err.localizedDescription)")
            }
        }
    }
}
