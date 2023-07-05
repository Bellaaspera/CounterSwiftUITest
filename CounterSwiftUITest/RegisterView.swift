//
//  RegisterView.swift
//  CounterSwiftUITest
//
//  Created by Светлана Сенаторова on 05.07.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var user: UserManager
    @State private var name = ""
    @State private var okButtonNotActive = true
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                
                Text(name.count.formatted())
                    .padding()
                    .foregroundColor(name.count < 3 ? .red : .blue)
            }
            
            Button (action: { registerUser() } ) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(name.count >= 3 ? !okButtonNotActive : okButtonNotActive)
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegistered.toggle()
        } 
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
