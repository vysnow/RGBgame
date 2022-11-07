//
//  ContentView.swift
//  HelloWorld
//
//  Created by John Chen on 2020/10/28.
//

import SwiftUI

struct ContentView: View {
    @State var rTarget = Double.random(in: 0..<1)
    @State var gTarget = Double.random(in: 0..<1)
    @State var bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    func refresh() -> (){
        self.rTarget = Double.random(in: 0..<1)
        self.gTarget = Double.random(in: 0..<1)
        self.bTarget = Double.random(in: 0..<1)
    }

    var body: some View {
        VStack {
            HStack {
                Text("Hello, world!")
                Text("你好，世界！")
            }.padding()
            Button(action: {
                self.showAlert = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"), message: Text("\(computeScore())"))
            }
            Button(action: {
                refresh()
            }) {
                Text("refresh")
            }
            
            VStack {
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
                Text("Alpha")
            }
            HStack {
              // Target color block
              VStack {
                Rectangle().foregroundColor(Color(red: rTarget, green: gTarget, blue: bTarget))
                Text("Match this color")
              }
              // Guess color block
              VStack {
                Rectangle().foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess))
                HStack {
                  Text("R:  \(Int(rGuess * 255.0))")
                  Text("G: \(Int(gGuess * 255.0))")
                  Text("B:  \(Int(bGuess * 255.0))")
                }
              }
            }
            Text("Rate score:  \(computeScore())")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color

    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }.padding()
    }
}
