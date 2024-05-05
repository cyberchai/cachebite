//
//  Laundry.swift
//  Food
//
//  Created by Zihan Lyu on 4/23/24.
//

import Foundation
import SwiftUI

struct Laundry: View {
    @State private var quantity = 11
    @State var meal : Card
    @State var heart = "heart.fill"
    var placeHolder = "hi i'm merissa and im a firstieeee yk how it is i hurt myself but i am a big lover. i have a huge conference i have to get to on friday with fresh clothes im almost out of clothes. bless you thank u so so much. mjuah"
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{reader in
                    Image(meal.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(meal.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<5){_ in
                            
                            Image(systemName: "")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text(meal.descrip)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top,5)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                heart = "heart"
                            }
                        }, label: {
                            Image(systemName: heart)
                                .font(.largeTitle)
                                .foregroundColor(.red)
                            
                        })
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Text("Description")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(placeHolder)
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
//                    HStack {
//                        Text("Accept ")
//                            .font(.title3)
//                            .bold()
//                        Spacer()
////                        Stepper("",
////                                onIncrement: {
////                                    quantity+=3
////                                }, onDecrement: {
////                                    quantity-=3
////                                })
//
//                            .foregroundColor(.black)
//                            .background(Color.white)
//                            .frame(width: 100)
//                    }.padding(.top, 10)
                    
                    Spacer()
                    HStack {
                        Text("Paying ")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("$\(quantity+1).00")
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, 10)
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            })
            
            
            Spacer()
            
            HStack{
                Spacer()
                Button(action: {}, label: {
                    Text("Accept")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 100)
                        .background(Color.green)
                        .cornerRadius(10)
                    
                })
                Spacer()
            }
            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            .edgesIgnoringSafeArea(.all)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
}

struct Laundry_Previews: PreviewProvider {
    static var previews: some View {
        Laundry(meal: TrendingCard[1])
    }
}
