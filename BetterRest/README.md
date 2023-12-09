# BetterRest SwiftUI App
This SwiftUI project, known as "BetterRest," is a forms-based app developed as part of my ongoing learning journey in iOS development. The app utilizes Core ML, a powerful feature in iOS development, to provide personalized sleep recommendations based on user input.
The app is form based but i decided to use a VStack instead and did some tweaking of the UI.

## App Overview
"BetterRest" is designed to help coffee drinkers improve their sleep quality by asking them three essential questions:
1. **When do they want to wake up?**
2. **Roughly how many hours of sleep do they want?**
3. **How many cups of coffee do they drink per day?**

## Tools Used
- **Swift** 
- **SwiftUI**
- **Core ML**
- **Xcode**

Once the user provides answers to these questions, the app uses Core ML to calculate and provide a personalized recommendation for when the user should go to bed. This involves using regression analysis to create an algorithm that can predict optimal bedtime based on the input data.

## Key Features
- Input for wake-up time, desired sleep duration, and daily coffee consumption.
- Integration of Core ML for machine learning predictions.
- Personalized sleep recommendations based on user input.


## How It Works
1. **Input Information:** Users enter details about their wake-up time, desired sleep duration, and daily coffee consumption.
2. **Machine Learning Magic:** The app utilizes Core ML and regression analysis to generate a personalized algorithm.
3. **Bedtime Recommendation:** Based on the algorithm, the app provides a tailored recommendation for the optimal bedtime.

## Screenshots
### Home View
<img src="https://github.com/Huss3n/IosApps/blob/main/BetterRest/untitled%20folder/scrnShot1.png" width="375px" height="812px">

### Alert View
<img src="https://github.com/Huss3n/IosApps/blob/main/BetterRest/untitled%20folder/scrnShot2.png" width="375px" height="812px">

## How to Use
1. Download or clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a physical device.

## Prerequisites
- Xcode 12 or later.
- Basic knowledge of SwiftUI and Swift programming.

## Acknowledgments
This project was inspired by the learning materials from my SwiftUI journey provided by [Paul Hudson](https://www.hackingwithswift.com/100/swiftui).

Feel free to contribute, report issues, or make suggestions!
