//
//  ContentView.swift
//  CounterSwiftUITest
//
//  Created by Светлана Сенаторова on 05.07.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle.bold())
                .padding(.top, 100)
            Spacer()
            CounterButton(timer: timer)
            Spacer()
            LogOutButton()
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct CounterButton: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: { timer.startTimer() }) {
            Text(timer.buttonTitle)
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .frame(width: 200, height: 60)
                .background(Color.red)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
        }
    }
}

struct LogOutButton: View {
    
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        Button(action: { user.isRegistered.toggle() }) {
            Text("Log Out")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .frame(width: 200, height: 60)
                .background(Color.blue)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
        }
    }
}
