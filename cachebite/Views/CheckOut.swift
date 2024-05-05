//
//  CheckOut.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import SwiftUI

struct CheckOut: View {
    @State var hero = false
    @State var acceptedRequests = AllCard // Correctly initialized list for the accepted requests
    @State var search = "" // For the search bar
    @State var match = false
    @State private var navigateToMakeRequest = false

    var body: some View {
        VStack {
            Spacer()
            
            ScrollView(.vertical, showsIndicators: true) { // Scroll vertically with indicators
                VStack(spacing: 10) {
                    HStack {
                        Text("My Requests")
                            .bold()
                            .padding(.leading, 30)
                        Spacer()
                        Text("Scroll down")
                            .foregroundColor(Color(#colorLiteral(red: 0.01, green: 0, blue: 0.3403331637, alpha:0.3)))
                            .padding(.trailing, 30)
                    }
                    
                    // Make a Request Botton
                    
                    Spacer()
                    
//                    Button(action: {
//                        navigateToMakeRequest = true
//                    }, label: {
//                        Text("Make a Request")
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                            .padding(.vertical, 10)
//                            .padding(.horizontal, 100)
//                            .background(Color.brown)
//                            .cornerRadius(10)
//                        
//                    })
                    
                    NavigationLink(
                        destination: MakeRequest(cards: .constant([])).navigationBarBackButtonHidden(true).navigationBarHidden(true),
                        label: {
                            Text("Make a Request")
                                .font(.headline)
                                .frame(width: 200, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.brown)
                                .cornerRadius(10)
                        }
                    )
                    
                    
                    
//                    .background(
//                        NavigationLink(destination: MakeRequest(cards: .constant([])), isActive: $navigateToMakeRequest) {
//                            EmptyView()
//                        }
////                        .hidden()
//                    )
                    
                    Spacer()

                    // Vertical scroll view for accepted requests
                    
                    ForEach(acceptedRequests) { card in
                        NavigationLink(
                            destination: RequestedCard(request: card), // Ensure this is the correct destination view
                            label: {
                                RequestedCard(request: card) // Update with proper initialization
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
        .background(Color.white /*(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))*/)
    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        CheckOut() // Initialization for preview
    }
}
