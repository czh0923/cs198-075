//
//  ContentView.swift
//  hw4
//
//  Created by Andy Huang on 3/2/23.
//

import SwiftUI

/* Just for placeholder data type. Not useful. */
enum DummyDataType {
    case dummy
}

struct ContentView: View {
    // The navigationStack control point. If appended to, it will navigate the user to a new view.
    @State var navPath = NavigationPath()
    
    // TODO: Uncomment solutionPath and initialize it to the correct value.
    // Array of strings representing the path to the maze exit.
    @State var solutionPath: [String] = ["Right", "Right", "Left"]
    
    // Array of strings representing the current path the user has taken.
    @State var currentPath: [String] = []
    // String representation of currentPath
    @State var currentPathString: String = ""
    // String representation of solutionPath. Helpful for debugging and testing.
    @State var solutionPathString: String = "don't by the same as empty string?"
    
    var body: some View {
        // NavigationStack wraps entire view.
        NavigationStack(path: $navPath) {
            VStack {
                // TODO: Menacing Maze Text Warning
                Text("Enter the maze if you dare!")
                
                // TODO: Begin game Button
                Button("Begin") {
                    navPath.append("")
                }
            }
            .navigationTitle("Maze Game")
            // TODO: Replace DummyDataType with correct data type.
            .navigationDestination(for: String.self) { action in
                // TODO: Replace EmptyView() with code to display correct view based on action pushed onto the navigation stack.
                //EmptyView()
                
                if (currentPathString == solutionPathString) {
                    Text("hereee")
                    Text("\(solutionPathString)")
                    
                    MazeExitView(navPath: $navPath, currentPath: $currentPath, solutionPath: $solutionPath, solutionPathString: $solutionPathString, currentPathString: $currentPathString)
                } else {
                    MazeLocationView(previous_action: action, navPath: $navPath, currentPath: $currentPath, solutionPath: $solutionPath, solutionPathString: $solutionPathString, currentPathString: $currentPathString)
                }
            }
        }
        .onAppear {
            // TODO: Uncomment after initializing solutionPath
            //Swift.print("hereeeee")
            solutionPathString = solutionPath.joined(separator: "->")
            //Swift.print(solutionPathString)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
