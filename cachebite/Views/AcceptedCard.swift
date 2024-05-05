//
//  AcceptedCard.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/25/24.
//
import Foundation
import SwiftUI

struct AcceptedCard: View {
    @State private var quantity = 5
    @State var task : Card
    @State var message = "message.badge.filled.fill"
//    @State var clock = "clock.fill"
    @State var complete = false
//    @State var match = false
    var placeHolder = "hi! could someone please bring me a meal from comstock with just rice and chicken by 7 pm tonight? will pay $6"
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
//                GeometryReader{reader in
//                    Image(task.image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .offset(y: -reader.frame(in: .global).minY)
//                        // going to add parallax effect....
//                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
//                    
//                }
                GeometryReader { reader in
                    Image(task.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY + 300)
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(task.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<5){_ in
                            
                            Image(systemName: "")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text("Request for: " + task.name)
                            .font(.caption)
                            .foregroundColor(.brown)
                            .padding(.top,5)
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.spring(dampingFraction: 0.5)) {
                                message = "message"
                            }
                        }, label: {
                            Image(systemName: message)
                                .font(.largeTitle)
                                .foregroundColor(.green)
                            
                        })
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
//                    HStack {
//                        Text(task.title)
//                            .bold()
//                            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
//                        Spacer()
//                    }
//                    .padding(.leading, self.card.expand ? 10 : 20)
//                    
                    HStack {
                        Text(task.descrip)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.leading, self.task.expand ? 20 : 30)
                        Spacer()
                        
                    }
//
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
                        Text("$\(quantity+1)")
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
                    Text(complete ? "Completed" : "Complete")
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

struct AcceptedCard_Previews: PreviewProvider {
    static var previews: some View {
        AcceptedCard(task: AllCard[0])
    }
}




