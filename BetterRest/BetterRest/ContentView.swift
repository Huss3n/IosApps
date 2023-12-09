//
//  ContentView.swift
//  BetterRest
//
//  Created by Muktar Hussein on 28/09/2023.
//
import CoreML
import SwiftUI

// practice on custom modifiers
struct Texting: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.weight(.semibold))
            .foregroundStyle(.primary)
            .padding()
    }
}

// extend it to use as a func
extension View{
    func useOnText() -> some View{
        modifier(Texting())
    }
}


struct ContentView: View {
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    // to fix the time starting at the current time of the user in the wake up time we use comouted properties
    // static means the component can be read at ant given time and not only when a change occurrs e.g state
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 30
        return Calendar.current.date(from: components) ?? Date.now
        
    }
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                    Text("When do you want to wake up?")
                        .useOnText()
                
                    DatePicker("Please choose the time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .padding(.horizontal, 10)
                
                    Text("How many hours do you want to sleep?")
                        .useOnText()
                HStack {
                    Text("\(sleepAmount.formatted()) hours")
                        .padding()
                    Stepper("Hours of sleep", value: $sleepAmount, in: 4...12, step: 0.25)
                            .labelsHidden()
                }
                Text("How many cups of coffee did you have?")
                    .useOnText()
                HStack{
                    Text("\(coffeeAmount == 1 ? "\(coffeeAmount) cup" : "\(coffeeAmount) cups")")
                        .useOnText()
                    Stepper("How many coffee cups", value: $coffeeAmount, in: 1...20)
                        .labelsHidden()
                }
//                Spacer()
//                Spacer()
                
                Button("Calculate", action: calculateBedTime)
                    .buttonBorderShape(.capsule)
                    .padding()
                    .buttonStyle(.borderedProminent)
                
                Spacer()
                Spacer()
                
            }
            .padding()
            .navigationTitle("BetterRest App")
            .alert(alertTitle, isPresented: $showAlert) {
                //
            } message: {
                Text("\(alertMessage)")
            }

//            .toolbar {
//                Button("Calculate", action: calculateBedTime)
//                    .buttonStyle(.borderedProminent)
//                    .shadow(radius: 10)
//            }
        }
    }
    
    func calculateBedTime(){
        // logic to calculate bedtime
       
        do {
            // do something
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            // do the prediction
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "You need to sleep at \(sleepTime.formatted(date: .omitted, time: .shortened))"
            alertMessage = "To be able to sleep for \(sleepAmount.formatted()) hours, your ideal bedtime should be \(sleepTime.formatted(date: .omitted, time: .shortened))"
            
        }catch{
            // catch errors
            alertTitle = "Error"
            alertMessage = "Sorry, something went wrong"
        }
        showAlert = true
    }

}

#Preview {
    ContentView()
}
