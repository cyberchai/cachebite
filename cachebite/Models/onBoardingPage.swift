//
//  onBoardingPage.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/23/24.
//

import Foundation

struct Page : Identifiable {
    var id : Int
    var image : String
    var title : String
    var descrip : String
}

//*************** NEED MODIFICATIONS ****************//
var Data = [
    Page(id: 0, image: "laundry", title: "Make Requests", descrip: "Make a request on campus that students can help you out with, whether it's bringing your CC meal to you, doing your laundry, or picking up your mail that's about to expire."),
    Page(id: 1, image: "mail", title: "Take Requests and Earn", descrip: "Accept a students' request and earn things like cash, goods, or points."),
    Page(id: 2, image: "other", title: "Make Campus more Accessible by Sharing", descrip: "Build your community by connecting with other students on campus who want to lend a helping hand!")
]
