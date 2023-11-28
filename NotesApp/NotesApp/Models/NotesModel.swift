//
//  NotesModel.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import Foundation

struct NotesModel:Identifiable {
    var id: String
    let title: String
    let notes: String
    
    init(id: String = UUID().uuidString, title: String, notes: String) {
        self.id = UUID().uuidString
        self.title = title
        self.notes = notes
    }
    
}
