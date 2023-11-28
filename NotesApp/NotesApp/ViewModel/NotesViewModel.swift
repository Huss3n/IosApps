//
//  NotesViewModel.swift
//  NotesApp
//
//  Created by Muktar Hussein on 28/11/2023.
//

import Foundation

class NotesViewModel: ObservableObject {
    @Published var notesByUser: [NotesModel] = []
    
//    
//    init() {
//        fakeNotes()
//    }
     
    
    // add notes to the array
    func addUserNote(title: String, notes: String) {
        let note = NotesModel(title: title, notes: notes)
        notesByUser.append(note)
    }
    
    // delete notes
    func delete(indexset: IndexSet) {
        notesByUser.remove(atOffsets: indexset)
    }
    
    // move notes
    func move(from: IndexSet, to: Int) {
        notesByUser.move(fromOffsets: from, toOffset: to)
    }
    
//    func fakeNotes() {
//        let fakeNote = NotesModel(title: "The Stardust Carriage: Amelia's Celestial Journey: Once upon a time in the quaint town of Eldridge", notes: "Once upon a time in the quaint town of Eldridge, there lived a peculiar inventor named Amelia Gearheart. Amelia was known far and wide for her eccentric creations that blended the fantastical with the practical. One sunny morning, as the town's clock tower chimed, she was struck with an idea that would change the course of Eldridge forever.")
//        
//        notesByUser.append(fakeNote)
//    }
    
}
