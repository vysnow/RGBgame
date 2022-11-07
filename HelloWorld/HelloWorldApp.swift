//
//  HelloWorldApp.swift
//  HelloWorld
//
//  Created by John Chen on 2020/10/28.
//

import SwiftUI

@main
struct HelloWorldApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
        }
    }
}
