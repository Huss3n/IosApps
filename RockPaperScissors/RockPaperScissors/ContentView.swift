import SwiftUI

enum Choice: String {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
}

struct ContentView: View {
    @State private var playerChoice: Choice?
    @State private var computerChoice: Choice = [.rock, .paper, .scissors].randomElement()!
    @State private var showAlert: Bool = false
    @State private var gameResult: String = ""
    @State private var playerScore = 0
    @State private var computerScore = 0
    @State private var chancesRemaining: Int = 10


    var body: some View {
        VStack {
            Spacer()
            Text("Rock, Paper, Scissors!!!")
                .font(.largeTitle)
                .padding()

            HStack {
                Button("Rock") { self.makeChoice(.rock) }
                    .padding()
                Button("Paper") { self.makeChoice(.paper) }
                    .padding()
                Button("Scissors") { self.makeChoice(.scissors) }
                    .padding()
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))

            Spacer()

            Text("Computer's Score: \(computerScore)")
                .padding()
                .font(.title.weight(.semibold))
            Text("User score: \(playerScore)")
                .font(.title.weight(.semibold))
                .padding()
            Text("Chances Remaining: \(chancesRemaining)")
                .font(.title.weight(.semibold))
                .padding()
            Spacer()
            

//            if let playerChoice = playerChoice {
//                Text("Your Choice: \(playerChoice.rawValue)")
//                    .padding()
//            }

            Spacer()

            if !gameResult.isEmpty {
                Text("Result: \(gameResult)")
                    .font(.headline)
                    .padding()
            }

        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(chancesRemaining == 0 ? "Game over!" : ""), message: Text("Result: \(gameResult)"), primaryButton: .destructive(Text("Restart")) {
                resetGame()
            },   secondaryButton: .default(Text("Continue")) {
                // Handle the action for "Ask Me" button if needed
            })
        }
    }

    func makeChoice(_ choice: Choice) {
        playerChoice = choice
        determineWinner()
        chancesRemaining -= 1

              if chancesRemaining == 0 {
                  showAlert = true
                  gameResult = "Game Over. You've reached the maximum number of chances.\(playerScore > computerScore ? "Computer" : "Player") wins"
              }
    }

    func determineWinner() {
        guard let playerChoice = playerChoice else { return }

        if playerChoice == computerChoice {
            gameResult = "It's a tie!"
        } else if (playerChoice == .rock && computerChoice == .scissors) ||
                  (playerChoice == .paper && computerChoice == .rock) ||
                  (playerChoice == .scissors && computerChoice == .paper) {
            gameResult = "You win!"
            playerScore += 1
        } else {
            gameResult = "You lose!"
            computerScore += 1
        }

        showAlert = true
    }

    func resetGame() {
        playerChoice = nil
        computerChoice = [.rock, .paper, .scissors].randomElement()!
        gameResult = ""
        chancesRemaining = 10
        playerScore = 0
        computerScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

