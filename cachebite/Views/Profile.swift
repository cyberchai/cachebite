//
//  Profile.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import SwiftUI

// Enum to track registration steps
enum RegistrationStep {
    case register
    case verify
    case settings
    case login
}

// Main Profile View
struct Profile: View {
    @State private var isLoginView = true
    @State private var errorMessage = ""
    @State private var registeredUsers: [String: String] = [:]
    @State private var isLoggedIn = false
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var email = ""
    @State private var isAppleCashLinked = false

    var body: some View {
        VStack {
            Spacer()

            if isLoggedIn {
                // Display the Welcome page if logged in
                WelcomeView(username: username)
                    .font(.title)
                    .padding()
            } else {
                if isLoginView {
                    // Display Login view when not logged in
                    LoginView(
                        username: $username,
                        password: $password,
                        registeredUsers: $registeredUsers,
                        errorMessage: $errorMessage,
                        isLoggedIn: $isLoggedIn
                    )
                } else {
                    RegisterView(
                        username: $username,
                        password: $password,
                        confirmPassword: $confirmPassword,
                        email: $email,
                        registeredUsers: $registeredUsers,
                        isAppleCashLinked: $isAppleCashLinked,
                        errorMessage: $errorMessage
                    )
                }

                Spacer()

                HStack {
                    Text(isLoginView ? "Don't have an account?" : "Already have an account?")
                    Button(action: {
                        isLoginView.toggle()
                        errorMessage = ""
                        isLoggedIn = false // Reset login status when switching views
                    }) {
                        Text(isLoginView ? "Register" : "Login")
                    }
                }
                
                // Display error messages
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
    }
}

// Login View
struct LoginView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var registeredUsers: [String: String]
    @Binding var errorMessage: String
    @Binding var isLoggedIn: Bool

    var body: some View {
        VStack(spacing: 20) {
            TextField("Username or Email", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                // Check if the username/email and password match
                if registeredUsers[username] == password {
                    isLoggedIn = true
                    errorMessage = "" // Clear the error message on success
                } else {
                    errorMessage = "Invalid username or password" // Display an error message on failure
                }
            }) {
                Text("Login")
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

// Welcome View
struct WelcomeView: View {
    let username: String

    var body: some View {
        Text("Welcome to CacheBite, \(username)!")
            .font(.title)
            .padding()
    }
}

// Register View
struct RegisterView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var email: String
    @Binding var registeredUsers: [String: String]
    @Binding var isAppleCashLinked: Bool
    @Binding var errorMessage: String

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Enter your password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm your password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter your email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .padding()

            Toggle("Link Apple Cash", isOn: $isAppleCashLinked)
                .padding()

            Button(action: {
                if password == confirmPassword {
                    registeredUsers[username] = password
                    errorMessage = ""
                } else {
                    errorMessage = "Passwords don't match"
                }
            }) {
                Text("Register")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
