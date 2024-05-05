//
//  OnBoarding.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import SwiftUI
import UIKit

struct OnBoarding: View {

    @State private var currentPage = 0
    @State var showSheetView = false
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .red
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentPage) {
                    ForEach(Data.indices, id: \.self) { index in
                        GeometryReader { g in
                            VStack {
                                Image(Data[index].image)
                                    .resizable()
                                    .scaledToFit()
                                Text(Data[index].title)
                                    .font(.title).bold()
                                    .padding(.all, 20)
                                Text(Data[index].descrip)
//                                    .multilineTextAlignment(.center)
                                    .padding(.all, 20)
                            }
                            .opacity(Double(g.frame(in: .global).minX) / 200 + 1)
                        }
                        .tag(index) // Tag the view with the current index
                    }
                }
                .edgesIgnoringSafeArea(.top)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                
                // Only show "Start" when the last page is viewed
                if currentPage == Data.count - 1 {
                    NavigationLink(
                        destination: Location().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                        label: {
                            Text("Start")
                                .font(.headline)
                                .frame(width: 200, height: 40, alignment: .center)
                                .foregroundColor(.white)
                                .background(Color.brown)
                                .cornerRadius(10)
                        }
                    )
                }
                
                Spacer()
            }
            .navigationBarItems(trailing:
                NavigationLink(
                    destination: Location().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label: {
                        Image(systemName: "arrow.right")
                            .font(Font.system(.title3))
                            .foregroundColor(Color(#colorLiteral(red: 0.9580881, green: 0.10593573, blue: 0.3403331637, alpha: 1)))
                    }
                )
            )
            .navigationBarBackButtonHidden(true)
        }
        .sheet(isPresented: $showSheetView) {
            Location()
        }
        .animation(.none)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
