//
//  Location.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import SwiftUI

struct Location: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("location")
                    .resizable()
                    .scaledToFit()
                Text("Hi, nice to meet you!")
                    .font(.title)
                    .bold()
                Text("Choose your location to find \nrestaurants around you.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                    .padding(.all, 20)
                
                NavigationLink(
                    destination: NavBar().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label: {
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(Color.brown)
                            Text("Use current location")
                                .bold()
                                .foregroundColor(Color.brown)
                        }
                        .frame(width: 300, height: 60, alignment: .center)
                        .border(Color.brown, width: 3)
                        .cornerRadius(5)
                    }
                )
                
                NavigationLink(
                    destination: ManualSelect().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label: {
                        Text("Select Manually")
                            .bold()
                            .underline()
                            .foregroundColor(.gray)
                            .padding(.top, 80)
                    }
                )
                
                Spacer()  // Adds space at the bottom
            }
            .padding()  // Apply padding to the entire VStack
        }
        .navigationViewStyle(StackNavigationViewStyle())  // Ensures proper rendering on different devices
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        Location()
    }
}
