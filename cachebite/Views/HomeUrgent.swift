//
//  HomeUrgent.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/25/24.
//

import SwiftUI

struct HomeUrgent: View {
    @State var card: Card
    @Binding var hero: Bool
    @State var heart = "heart"
    @State var complete = false

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    Image(card.image)
                        .resizable()
//                        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.25)
                        .frame(width: UIScreen.main.bounds.width*1, height: UIScreen.main.bounds.height*0.33)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    

                }
                
//                VStack(alignment: .leading, spacing: 15) {
//                    Text(card.title)
//                        .font(.system(size: 35, weight: .bold))
//                    
//                    Text(card.descrip)
//                        .font(.caption)
//                        .foregroundColor(.gray)
//                        .padding(.top, 5)
//                    
//                    HStack {
//                        Button(action: {
//                            heart = (heart == "heart") ? "heart.fill" : "heart"
//                        }) {
//                            Image(systemName: heart)
//                                .font(.largeTitle)
//                                .foregroundColor(.red)
//                        }
//                    }
//                    
//                    HStack {
//                        Text("Paying")
//                            .font(.title3)
//                            .bold()
//                        Spacer()
//                        Text("$\(card.price)")
//                            .font(.title2)
//                            .bold()
//                    }
//                    .padding(.top, 10)
//                }
                
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            }
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    Text(card.title)
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(card.descrip)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
//                    HStack {
//                        Button(action: {
//                            heart = (heart == "heart") ? "heart.fill" : "heart"
//                        }) {
//                            Image(systemName: heart)
//                                .font(.largeTitle)
//                                .foregroundColor(.red)
//                        }
//                    }
                    
                    HStack {
                        Text("Paying")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("$\(card.price)")
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, 10)
                }
                Spacer()
                Button(action: {
                    complete = true
                }) {
                    Text(complete ? "Accepted" : "Accept")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 5)
                        .background(complete ? Color.gray : Color.green)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding(10)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct HomeUrgent_Previews: PreviewProvider {
    static var previews: some View {
        HomeUrgent(card: AllCard[3], hero: .constant(false))
    }
}
