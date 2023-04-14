//
//  q1.swift
//  hw8
//
//  Created by Andy Huang on 3/31/23.
//

import SwiftUI

struct q1: View {
    // Degree of rotation of the circle.
    @State var rotation = 0.0
    // Color of the circle.
    @State var color = Color.green
    
    var body: some View {
        Button("Click Me!") {
            // TODO: Implement State Change Logic
            rotation += 360
            if (color == Color.green) {
                color = Color.red
            } else {
                color = Color.green
            }
        }
        .frame(width: 200, height: 200)
        .background(color)
        .clipShape(Circle())
        .rotation3DEffect(Angle(degrees: rotation), axis: (x: 0, y: 1, z: 0))
        .animation(.interpolatingSpring(stiffness: 50, damping: 45), value: rotation)
        // TODO: Implement Button Modifiers
    }
}

struct q1_Previews: PreviewProvider {
    static var previews: some View {
        q1()
    }
}
