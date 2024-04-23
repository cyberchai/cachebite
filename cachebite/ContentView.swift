//
//  ContentView.swift
//  cachebite
//
//  Created by Chaira Harder on 4/23/24.
//

//import SwiftUI

//struct ContentView: View {
//    @State private var isLoginView = true
//    @State private var errorMessage = ""
//    @State private var registeredUsers: [String: String] = [:] // Dictionary to store registered usernames and passwords
//    @State private var isLoggedIn = false // Track login status
//
//    var body: some View {
//        VStack {
//            Spacer()
//
//            if isLoginView {
//                LoginView(errorMessage: $errorMessage, registeredUsers: $registeredUsers, isLoggedIn: $isLoggedIn)
//            } else {
//                RegisterView(registeredUsers: $registeredUsers)
//            }
//
//            Spacer()
//
//            HStack {
//                Text(isLoginView ? "Don't have an account?" : "Already have an account?")
//                Button(action: {
//                    isLoginView.toggle()
//                    errorMessage = ""
//                }) {
//                    Text(isLoginView ? "Register" : "Login")
//                }
//            }
//
//            Text(errorMessage)
//                .foregroundColor(.red)
//            
//            NavigationStack {
//                NavigationLink(isActive: $isLoggedIn, destination: {
//                    HomePage()
//                }, label: {
//                    EmptyView()
//                })
//            }
//        }
//        .padding()
//    }
//}

import SwiftUI

struct ContentView: View {
    @State private var isLoginView = true
    @State private var errorMessage = ""
    @State private var registeredUsers: [String: String] = [:] // Dictionary to store registered usernames and passwords
    @State private var isLoggedIn = false // Track login status

    var body: some View {
        NavigationStack {
            VStack {
                if isLoggedIn {
                    NavigationLink(destination: HomePage(), isActive: $isLoggedIn) {
                        EmptyView() // This NavigationLink is to redirect to HomePage
                    }
                } else {
                    Spacer()

                    if isLoginView {
                        LoginView(
                            errorMessage: $errorMessage,
                            registeredUsers: $registeredUsers,
                            isLoggedIn: $isLoggedIn
                        )
                    } else {
                        RegisterView(registeredUsers: $registeredUsers)
                    }

                    Spacer()

                    HStack {
                        Text(isLoginView ? "Don't have an account?" : "Already have an account?")
                        Button(action: {
                            isLoginView.toggle()
                            errorMessage = ""
                        }) {
                            Text(isLoginView ? "Register" : "Login")
                        }
                    }

                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @Binding var errorMessage: String
    @Binding var registeredUsers: [String: String]
    @Binding var isLoggedIn: Bool // Binding for login status

    var body: some View {
        VStack {
            Image("login")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()

            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Perform login action
                if let storedPassword = registeredUsers[username], storedPassword == password {
                    isLoggedIn = true // Set login status to true
                    // Logged in successfully
                } else {
                    errorMessage = "User name or password is incorrect!"
                }
            }) {
                Text("Login")
            }
        }
    }
}

struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isRegistered = false // Track registration status
    @State private var registrationStatusMessage = "" // Track registration status message
    @Binding var registeredUsers: [String: String]

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // Perform registration action
                if password == confirmPassword {
                    // Check if username already exists
                    if let _ = registeredUsers[username] {
                        registrationStatusMessage = "Username already exists"
                    } else {
                        // Register new user
                        registeredUsers[username] = password
                        isRegistered = true
                        registrationStatusMessage = "Your account is successfully registered"
                    }
                } else {
                    registrationStatusMessage = "Passwords do not match"
                }
            }) {
                Text("Register")
            }

            if !registrationStatusMessage.isEmpty {
                Text(registrationStatusMessage)
                    .foregroundColor(isRegistered ? .green : .red)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
