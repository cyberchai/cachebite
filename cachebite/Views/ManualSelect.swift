//
//  ManualSelect.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import SwiftUI

struct ManualSelect: View {
    @State private var addressLine1 = ""
    @State private var addressLine2 = ""
    @State private var postalCode = ""
    @State private var selectedState = ""

    let states = [
        "Massachusetts", "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
        "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
        "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
        "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
        "West Virginia", "Wisconsin", "Wyoming"
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Enter Address")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)

                TextField("Address Line 1", text: $addressLine1)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)

                TextField("Address Line 2 (Optional)", text: $addressLine2)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)

                TextField("Postal Code", text: $postalCode)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(5)

                Picker("Select State", selection: $selectedState) {
                    ForEach(states, id: \.self) { state in
                        Text(state)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .padding()
                
                NavigationLink(
                    destination: NavBar().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label: {
                        Text("Submit")
                            .padding()
                            .frame(width: 200, height: 40)
                            .background(Color.brown)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                )

                Spacer()
            }
            .padding()
        }
    }
}

struct ManualSelect_Previews: PreviewProvider {
    static var previews: some View {
        ManualSelect()
    }
}
