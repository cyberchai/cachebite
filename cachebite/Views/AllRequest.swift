//
//  AllRequest.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import SwiftUI

struct AllRequest: View {
    @Binding var card : Card
    @Binding var hero : Bool
    @State var heart = "heart"
    var body: some View {
        VStack {
            ZStack {
                Image(card.image)
                    .resizable()
                    .frame(width: self.card.expand ? (UIScreen.main.bounds.width) : (UIScreen.main.bounds.width)*0.9 , height: self.card.expand ? (UIScreen.main.bounds.height)*0.3 : (UIScreen.main.bounds.height)*0.25 )
                    .cornerRadius(self.card.expand ? 5 : 20)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                if (self.card.expand) {
                    HStack{
                        Spacer()
                        Button(action: {
                            
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                
                                self.card.expand.toggle()
                                self.hero.toggle()
                            }
                            
                        }) {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.black.opacity(0.8))
                                .clipShape(Circle())
                            
                        }
                    }
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }.edgesIgnoringSafeArea(.top)
            
        
            HStack {
                Text(card.title)
                    .bold()
                    .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding(.leading, self.card.expand ? 10 : 20)
            
            HStack {
                Text(card.descrip)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.leading, self.card.expand ? 20 : 30)
                Spacer()
                
            }
            
            HStack {
                Text("Paying ")
                    .font(.subheadline)
                    .bold()
                
                Spacer()
                
                Text("$\(String(card.price)).00")
                    .font(.subheadline)
                    .bold()
            }
            .padding(.leading, self.card.expand ? 30 : 40)
            

            .padding(.bottom, 30)
            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.trailing, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.leading, self.card.expand ? 10 : 20)
            .padding(.trailing, self.card.expand ? 10 : 20)
            
            
            
            
            if self.card.expand {
                VStack{
                    HStack {
                        Text("Description")
                            .font(.title)
                            .bold()
                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                heart = "heart"
                            }
                        }, label: {
                            Image(systemName: heart)
                                .font(.title)
                                .foregroundColor(.red)
                            
                        })
                        .padding(.trailing, 30)
                    }
//                    Text("Nine years earlier, Lorem ipsum dolor sit amet,Morbi sed purus nulla. Curabitur dapibus ultrices lorem vitae tincidunt. Pellentesque quis arcu sit amet urna commodo porttitor. Aenean sit ")
//                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                
                
            }
            
            
            
        }
    }
}

