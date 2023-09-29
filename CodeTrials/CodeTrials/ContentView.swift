//
//  ContentView.swift
//  CodeTrials
//
//  Created by Muktar Hussein on 27/09/2023.
//
// stepper
// date picker
// lists
// forms


import SwiftUI

// build a custom modifier
struct Title : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .padding(.vertical, 10)
            .foregroundStyle(.red)
            .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

// Button modifier
//struct Buttons: ViewModifier {
//    func body(content: Content) -> some View {
//        Button
//            .buttonStyle(.borderedProminent)
//            .foregroundStyle(.primary)
//            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//    }
//}


struct Input: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.primary)
            .font(.headline.weight(.semibold))
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .border(Color.black)
    }
}
extension View {
    func useOnTitles() -> some View {
        modifier(Title())
    }
    func useOnInputs() -> some View {
        modifier(Input())
    }
}


// picker and date modifiers
struct PickerDate: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.weight(.semibold))
            .padding()
    }
}


extension View {
    func useOnDateStepper() -> some View {
        modifier(PickerDate())
    }
}



struct ContentView: View {
    @State private var name = ""
    @State private var password = ""
    @State private var message  = ""
    @State private var isRegistered = false
    @State private var showAlert = false
    let correctPassword = "123Hh"
    @State private var availableHours = 2
    @State private var startDate = Date.now
    @State private var picked = ["20k", "40k", "50k", "80k"]
    @State private var starter = "40k"
    
    // check password
    func handleClick(){
        if name == "" {
            return
        }
        if password == correctPassword {
            message = "\(name) has successfly been added to the database. You will start on \(startDate) and work \(availableHours) hours a day"
            showAlert = true
        }else {
            message = "Wrong password"
            showAlert = true
        }
    }
    var body: some View {
        VStack(spacing: 10) {
            // name
            Text("Name")
                .useOnTitles()
            TextField("Enter name", text: $name)
                .useOnInputs()
            
            // password
            Text("Password")
                .useOnTitles()
            TextField("Enter Password", text: $password)
                .useOnInputs()
            
            // available hours
            // stepper
            // has in for the range of the values e.g dont go lower than 4 or higher than 12
            // has step for how the values need to move e.g the difference between them
            // add .formated to format the data e.g remove decimal places
            Stepper("Hours available: \(availableHours)", value: $availableHours, in: 2...8)
                .useOnDateStepper()
            //                .controlSize(.large)
            
            // date to start
            // to only display date we choose displayed components as date
            // to hide labels we can add labels hidden
            // we can also use the range e.g date.now... for the current date to future dates
            // we can omit the dat
            // wwe can shorten the time
            DatePicker("Start Date", selection: $startDate, in: Date.now..., displayedComponents: .date)
                .useOnDateStepper()
            
            // picker
            HStack{
                Text("Choose investment amount")
                Picker("Choose base pay", selection: $starter) {
                    ForEach(picked, id: \.self){
                        Text($0)
                    }
                }
            }
                
                // login signup button
                Button(isRegistered ? "Login" : "Signup", action: handleClick)
                    .buttonStyle(.borderedProminent)
                    .padding()
                
                Button(isRegistered ? "Don't have an account? Register" : "Have an account? Login"){
                    isRegistered.toggle()
                }
                .buttonStyle(.bordered)
            }
            .padding()
            .alert(message, isPresented: $showAlert) {
                Button("Ok"){
                }
            }message: {
                Text("Thank you for signing up")
            }
            
        }
    }


#Preview {
    ContentView()
}
