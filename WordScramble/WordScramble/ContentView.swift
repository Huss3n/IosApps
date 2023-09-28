//
//  ContentView.swift
//  WordScramble
//
//  Created by Muktar Hussein on 28/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Ener your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section{
                    ForEach(usedWords, id: \.self){word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit {
                addNewWord()
            }
            // calling when the view is shown for the first time
            .onAppear(perform: {
                startGame()
            })
        }
    }
    
    // add word to the array
    func addNewWord(){
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else {return}
        
        // more input validation
        withAnimation {
            usedWords.insert(answer, at: 0)   
        }
       
        newWord = ""
    }
    
    // this func is called immedietly the view appears and loads the bundle to the app
    func startGame(){
        if let startingWodsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startingWodsURL){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Word"
                return
            }
        }
        fatalError("Could not load start.txt file from the bundle")
    }
}

#Preview {
    ContentView()
}
