//
//  RequestedCard.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/25/24.
//

import Foundation
import SwiftUI

struct RequestedCard: View {
    @State var data = AllCard
    @State var request : Card
    @State var message = "message.badge.filled.fill"
    @State var clock = "clock.fill"
    @State var complete = false
    @State var match = false
    var placeHolder = "hi i'm merissa and im a firstieeee yk how it is i hurt myself but i am a big lover. i have a huge conference i have to get to on friday with fresh clothes im almost out of clothes. bless you thank u so so much. mjuah"
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{reader in
                    Image(request.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(request.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<5){_ in
                            
                            Image(systemName: "")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
//                        Text(request.descrip)
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                            .padding(.top,5)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                clock = "clock"
                            }
                        }, label: {
                            Image(systemName: clock)
                                .font(.largeTitle)
                                .foregroundColor(.orange)
                            
                        })
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
           
                    HStack {
                        Text(request.descrip)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.leading, self.request.expand ? 20 : 30)
                        Spacer()
                        
                    }
                    
//                    Text("Description")
//                        .font(.system(size: 25, weight: .bold))
//                    
//                    Text(placeHolder)
//                        .padding(.top, 10)
//                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    HStack {
                        Text("Paying ")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("$\(String(request.price))")
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
                Button(action: {complete = true}, label: {
                    Text(complete ? "Edited" : "Edit")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 100)
                        .background(complete ? Color.gray : Color.green)
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

struct RequestedCard_Previews: PreviewProvider {
    static var previews: some View {
        RequestedCard(request: AllCard[0])
    }
}





