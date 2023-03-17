//
//  ContentView.swift
//  Biography
//
//  Created by Enya Do on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    //PART 2B - Create booleans to track your sheet visibility
    @State var showSheet1: Bool = false
    @State var showSheet2: Bool = false
    @State var showSheet3: Bool = false
    @State var showSheet4: Bool = false
    
    var body: some View {
        //PART1A - Design your header
        
        VStack {
            Text("All about")
            Text("Pumpkin!!")
            Image("cat").resizable()
                .scaledToFit()
                .frame(width: 400.0, height: 250.0)
            
            Spacer()
        }
      
        
        //PART1B - Add your form containing your buttons
        Form {
            Button("Spawn Point") {
                showSheet1.toggle()
            }
            .sheet(isPresented: $showSheet1) {
                Sheet1()
            }
            
            Button("onnom") {
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2) {
                Sheet2()
            }
            
            Button("Numba 1 Toy") {
                showSheet3.toggle()
            }
            .sheet(isPresented: $showSheet3) {
                Sheet3()
            }
            
            Button("Da Best Hooman") {
                showSheet4.toggle()
            }
            .sheet(isPresented: $showSheet4) {
                Sheet4()
            }
        }
        
    }
}

//PART2A - Creating a sheet
struct Sheet1: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        
        HStack {
            Button("Back") {
                dismiss()}
            .padding(10)
                .foregroundColor(.white)
                .background(.yellow)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                .padding(.bottom, 20)
            Spacer()
        }
        
        Text("Spawn Point")
            .bold()
            .font(Font.system(size: 24))
        Text("some random street!")
            .padding(.bottom, 10)
        Text("First Date on Earth").bold()
        Text("Unknown")
        
        Spacer()
    }

}

struct Sheet2: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        HStack {
            Button("Back") {
                dismiss()}
            .padding(10)
                .foregroundColor(.white)
                .background(.yellow)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                .padding(.bottom, 20)
            Spacer()
        }
        
        Text("Fav Food")
            .bold()
            .font(Font.system(size: 24))
        Text("fish fish fish")
            .padding(.bottom, 10)
        Text("Fav Snack").bold()
        Text("more fish fish fish")
        
        Spacer()
    }

}

struct Sheet3: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        HStack {
            Button("Back") {
                dismiss()}
            .padding(10)
                .foregroundColor(.white)
                .background(.yellow)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                .padding(.bottom, 20)
            Spacer()
        }
        
        Text("Fav Toy")
            .bold()
            .font(Font.system(size: 24))
        Text("stuffed animal")
            .padding(.bottom, 10)
       
        Spacer()
    }

}

struct Sheet4: View {
    //This code allows us to call the dismiss() function which closes the sheet view
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        //Add some content to the body of your sheet!
        //Remember to include a button that just calls dismiss() in the action
        HStack {
            Button("Back") {
                dismiss()}
            .padding(10)
                .foregroundColor(.white)
                .background(.yellow)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                .padding(.bottom, 20)
            Spacer()
        }
        
        Text("Fav Hooman")
            .bold()
            .font(Font.system(size: 24))
        Text("Mr likes no hooman")
            .padding(.bottom, 10)
        
        
        Spacer()
    }

}

// As a reminder the code below displays a live preview of your app, feel free to comment out or delete it!
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
