//
//  ContentView.swift
//  Theory
//
// tutorials read from the apple dicumentation

// the first view
import SwiftUI

struct customMode: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.weight(.semibold))
            .padding(.vertical, 4)
            .foregroundStyle(.primary)
    }
}
struct newMode: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding()
            .background(.purple.opacity(0.75), in: Capsule())
    }
}

extension View {
    func useOnTexts() -> some View {
        modifier(customMode())
    }
    }

struct ContentView: View {
//    @State private var name = "Hussein"
//    @State private var appSettings = ["Profile Photo", "Theme", "Version", "Log out"]
//    @State private var showAlert = false
//    @State private var buttonMesage = ""
//    
    var label: String
    var symbol: String
    
    
    func buttonClicked(){
//        showAlert = true
    }
    var body: some View {
//        Form{
//            Section{
//                Text("\(name)")
//                    .useOnTexts()
//            }header: {
//                Text("Username")
//            }
//            
//            Section{
//                ForEach(appSettings, id: \.self){setting in
//                    Button(setting) {
//                        buttonClicked()
//                        buttonMesage = setting
//                    }
//                    .buttonStyle(.plain)
//                }
//            }header: {
//                Text("App settings")
//            }
//            .alert(buttonMesage, isPresented: $showAlert){
//                Button("Ok", action: {})
//            }message: {
//                Text("You clicked the \(buttonMesage) button")
//            }
//        }
        
        // label
        Label(label, systemImage: symbol)
            .modifier(newMode())
    }
}
//
//#Preview {
//    static let label = ["chives", "fern-leaf lavender"]
//    ContentView()
//}
struct ContentView_Previews: PreviewProvider {
    static let keywords = ["chives", "fern-leaf lavender"]
    static var previews: some View {
        VStack {
            ForEach(keywords, id: \.self) { word in
                ContentView(label: word, symbol: "leaf")
            }
        }
    }
}
