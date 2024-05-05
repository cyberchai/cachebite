//
//  HomePage.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import SwiftUI

struct HomePage: View {
    @State private var firstName = "" // Variable to store the first name
    @State private var lastName = "" // Variable to store the last name
    @State private var birthday = Date() // Variable to store the birthday, initialized to today's date

    var body: some View {
        Form { // Using a form for structured layout
            Section(header: Text("Welcome to the Home Page!")) {
                Text("Please provide your details below")
                    .font(.headline)
                    .padding(.bottom, 10)
            }

            Section(header: Text("Personal Information")) { // Section for personal information
                TextField("First Name", text: $firstName) // Field to enter first name
                TextField("Last Name", text: $lastName) // Field to enter last name
            }

            Section(header: Text("Birthday")) { // Section for birthday setup
                DatePicker("Select your birthday", selection: $birthday, displayedComponents: .date) // Interaction scroll for birthday
                    .datePickerStyle(WheelDatePickerStyle()) // Use wheel style for interaction
            }
        }
        .navigationBarTitle("Home Page") // Title for navigation bar
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


