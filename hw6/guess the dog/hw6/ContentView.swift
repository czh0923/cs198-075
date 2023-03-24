//
//  ContentView.swift
//  hw6
//
//  Created by Andy Huang on 3/8/23.
//

import SwiftUI

/* The main view that is displayed to users. */
struct ContentView: View {
    // The dog's breed
    @State var dogBreed: String = ""
    // URL of image from API call
    @State var imageURL: String = ""
    // User's input
    @State var user_guess: String = ""
    // User's best streak
    @State var best_streak: Int = 0
    // User's streak for the current run
    @State var streak: Int = 0
    // True when user has made an incorrect guess, false otherwise.
    @State var incorrectGuess: Bool = false
    
    // Colors!
    let lightBlue = Color(red: 135/255, green: 206/255, blue: 250/255)
    let lavender = Color(red: 220/255, green: 208/255, blue: 255/255)
    
    var body: some View {
        ZStack {
            // TODO: Part 1a - Linear Gradient Background.
            LinearGradient(gradient: Gradient(colors: [lightBlue, lavender]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            // VStack in foreground
            VStack {
                // TODO: Part 1b - Title.
                Text("Guess that dog!")
                    .font(.system(size: 30))
                    .padding(.bottom, 20)
                
                HStack {
                    // TODO: Part 1b - Streak Text.
                    Text("Streak: \(streak)")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // TODO: Part 1b - Best Streak Text.
                    Text("Best Streak: \(best_streak)")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 60)
                
                // TODO: PART 3a - Replace the hardcoded string URL with the imageURL.
                // Ansyncronously loads an image from the URL.
                AsyncImage(url: URL(string: imageURL)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 256, height: 256)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 256, height: 256)
                
                // TODO: PART 1b - Display the generated hint.
                
                //Text(imageURL)
                Text(generateHint(input:dogBreed))
                
                
                TextField("", text: $user_guess)
                    .disableAutocorrection(true)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 50)
                    .onSubmit {
                        // TODO: Part 3b - Guess submission logic.
                        if (user_guess.lowercased() == dogBreed) {
                            
                            streak += 1
                            
                            if (streak > best_streak) {
                                best_streak = streak
                            }
                            
                            user_guess = ""
                            
                            
                            Task {
                                // Hint: You should be fetching a new doggy here!
                                
                                let dog = await fetchDoggy()
                                imageURL = dog.message
                                dogBreed = getDogName(imageURL: imageURL)
                                
                            }
                        } else {
                            
                            incorrectGuess = true
                            
                        }
                        
                    }
                
                // TODO: Part 1b - Submit Guess Button.
                Button("Submit Guess") {
                    if (user_guess.lowercased() == dogBreed) {
                        
                        streak += 1
                        
                        if (streak > best_streak) {
                            best_streak = streak
                        }
                        
                        user_guess = ""
                        
                        Task {
                            // Hint: You should be fetching a new doggy here!
                            
                            let dog = await fetchDoggy()
                            imageURL = dog.message
                            dogBreed = getDogName(imageURL: imageURL)
                            
                        }
                    } else {
                        
                        incorrectGuess = true
                        
                    }
                }
                    .padding(.top, 20)
                    .foregroundColor(.white)
                
                    .alert("Wrong 🐶!", isPresented: $incorrectGuess) {
                            Button("Play Again", role: .cancel) {
                                // Code here will execute after dismissing alert.
                                streak = 0
                                user_guess = ""
                                Task {
                                    let dog = await fetchDoggy()
                                    imageURL = dog.message
                                    dogBreed = getDogName(imageURL: imageURL)
                                }
                                
                          }
                        } message: {
                                Text("It was \(dogBreed) \n Your streak was \(streak)")
                             
                        }
                
                // TODO: Part 3b - Guess submission logic in Button. Hint: Should be exact same as TextField.onSubmit{ }.
                // TODO: Part 3c - Incorrect guess alert (attached to submit guess button).
                
                Spacer()
                Spacer()
                
                // Answer for debugging/testing purposes.
                Text("\(dogBreed)")

            }
            .task {
                // TODO: Part 3a - Fetch a doggy upon loading the app.
                
                let dog = await fetchDoggy()
                imageURL = dog.message
                dogBreed = getDogName(imageURL: imageURL)
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

