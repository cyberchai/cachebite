//
//  Card.swift
//  cachebite
//
//  Created by Zihan Lyu on 4/25/24.
//

struct Card : Identifiable {
    var id : Int
    var name : String
    var image : String
    var title : String
    var category : String
    var descrip : String
    var price : Int
    var status : String
    var editMode : Bool
    var expand : Bool
}

//*************** NEED MODIFICATIONS ****************//
// OLD STRUCTURE
//var AllCard = [
////    Card(id: 0, image: "dining32", title: "Comstock to Parsons", descrip: "hi! could someone please bring me a meal from comstock with just rice and chicken by 7 pm tonight? will pay $6", stars: 6, expand: false),
////    Card(id: 1, image: "laundry32", title: "Laundry in Morrow House", descrip: "Hey! I sprained both of my ankles over the weekend at the Comstock party could someone PLZ PLZ do my laundry this week I need it done so bad",stars: 5, expand: false),
////    Card(id: 2, image: "mail32", title: "Chinese Salad", descrip: "Best Seller",stars: 4, expand: false),
////    Card(id: 3, image: "laundry21", title: "Crispy Chicken Sandwich", descrip: "other",stars: 5, expand: false),
////    Card(id: 4, image: "maxresdefault2", title: "Shrimp Fries", descrip: "Hot Sauce",stars: 3, expand: false),
////    Card(id: 5, image: "maxresdefault3", title: "Pizza pineapple", descrip: "dont buy iy",stars: 1, expand: false),
//    Card(id: 0, image: "dining32", status: "pending", title: "Comstock to Parsons", descrip: "hi! could someone please bring me a meal from comstock with just rice and chicken by 7 pm tonight? will pay $6", price: 6, editMode: true, category: "Dining", expand: false),
//    Card(id: 1, image: "laundry32", status: "pending", title: "Laundry in Morrow House", descrip: "Hey! I sprained both of my ankles over the weekend at the Comstock party could someone PLZ PLZ help me with my laundry this week I need it done badly", price: 12, editMode: true, category: "Laundry", expand: false),
//    Card(id: 2, image: "mail32", status: "pending", title: "Weee! Pickup", descrip: "My snack order from Weee arrived, could someone please help me pick it help? I will dm you the Bank number and code", price: 10, editMode: true, category: "Mail Service", expand: false),
//    Card(id: 3, image: "other21", status: "pending", title: "Cat Food Refill", descrip: "Urgent! I am at a Conference now and I forgot to prepare food for my cat in dorm. Please help me refill her food & water! Thank you sosososososo much!!", price: 20, editMode: true, category: "Others", expand: false)
//    
//]

var AllCard = [
    Card(id: 0, name: "Sharon", image: "dining32", title: "Comstock to Parsons", category: "Dining", descrip: "hi! could someone please bring me a meal from comstock with just rice and chicken by 7 pm tonight? will pay $6", price: 6, status: "pending",  editMode: true, expand: false),
        Card(id: 1, name: "Claire", image: "laundry32", title: "Laundry in Morrow House", category: "Laundry", descrip: "Hey! I sprained both of my ankles over the weekend at the Comstock party could someone PLZ PLZ help me with my laundry this week I need it done badly", price: 12, status: "pending", editMode: true, expand: false),
        Card(id: 2, name: "Kate", image: "mail32", title: "Weee! Pickup", category: "Mail", descrip: "My snack order from Weee arrived, could someone please help me pick it help? I will dm you the Bank number and code", price: 10, status: "pending", editMode: true, expand: false),
        Card(id: 3, name: "Bobi", image: "other21", title: "Cat Food Refill", category: "Other", descrip: "Urgent! I am at a Conference now and I forgot to prepare food for my cat in dorm. Please help me refill her food & water! Thank you sosososososo much!!", price: 20, status: "pending", editMode: true, expand: false)
]


var Categories = ["Dining", "Laundry", "Mail Service", "Others"] // Only for HomeView list of Strings
