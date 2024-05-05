//
//  Tasks.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/25/24.
//

import Foundation

import SwiftUI

struct Tasks: View {
    @State var hero = false
    @State var acceptedRequests = AllCard // Correctly initialized list for the accepted requests
    @State var search = "" // For the search bar

    var body: some View {
        VStack {
            //CheckBar() // Custom check bar for the view
            Spacer()
            
            ScrollView(.vertical, showsIndicators: true) { // Scroll vertically with indicators
                VStack(spacing: 10) {
                    HStack {
                        Text("My Tasks")
                            .bold()
                            .padding(.leading, 30)
                        Spacer()
//                        Text("Scroll down")
//                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0, blue: 0.3403331637, alpha: 1)))
//                            .padding(.trailing, 30)
                    }

                    // Vertical scroll view for accepted requests
                    ForEach(acceptedRequests) { card in
                        NavigationLink(
                            destination: AcceptedCard(task: card), // Ensure this is the correct destination view
                            label: {
                                AcceptedCard(task: card) // Update with proper initialization
                                    .background(Color.white)
                                    .cornerRadius(15)
                                    .shadow(radius: 1)
                                    .padding(.vertical, 5) // Add spacing between cards
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 20) // Add horizontal padding for aesthetics
            }
            .background(Color(#colorLiteral(red: 0.9843164086, green: 0.9843164086, blue: 0.9843164086, alpha: 1)))
            .edgesIgnoringSafeArea(.top) // To maintain the top appearance
        }
//        .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))) // Darker background
        .background(Color.white/*(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))*/)
    }
}

struct TasksBar: View {
    @State var search = "" // Search state variable for the text field

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)), Color(#colorLiteral(red: 0.9843164086, green: 0.9843164086, blue: 0.9843164086, alpha: 1))]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.25)
            .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text("Accepted Requests")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                    Spacer()
                    Text("Completed")
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                }

                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .font(.title)
                    TextField("Search...", text: $search) // Use the state variable in the text field
                        .font(.title3)
                }
                .frame(width: UIScreen.main.bounds.width * 0.85, height: 40)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 10)
            }
        }
    }
}

struct Tasks_Previews: PreviewProvider {
    static var previews: some View {
        Tasks() // Initialization for preview
    }
}
