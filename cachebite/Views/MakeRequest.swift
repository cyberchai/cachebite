//
//  MakeRequest.swift
//  cachebite
//
//  Created by Chaira Harder on 4/28/24.
//

import Foundation
import SwiftUI

struct MakeRequest: View {
//    var nextCardID: Int = 1
    @State private var nextCardID: Int = 1
//    @State private var img: String = ""
    @State private var name: String = ""
    @State private var title: String = ""
    @State private var category: String = ""
    @State private var description: String = ""
    @State private var priceString: String = ""
    @State private var showAlert: Bool = false
    @Binding var cards: [Card]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Title", text: $title)
                    TextField("Your Name", text: $name)
                    TextField("Category (laundry, dining, mail, other)", text: $category)
                    TextField("Description", text: $description)
                    TextField("Price", text: $priceString)
                        .keyboardType(.decimalPad)
                }

                Section {
                    Button("Submit Request") {
                        submitRequest()
                    }
                }
            }
            .navigationBarTitle("Make a Request", displayMode: .inline)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"), message: Text("Please check your inputs and try again."), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // switch case for default image
    private var defaultImage: String {
            switch category {
                case "laundry":
                    return "laundry32"
                case "dining":
                    return "dining32"
                case "mail":
                    return "mail32"
                default:
                    return "other21"
            }
        }

    private func submitRequest() {
        guard let price = Int(priceString), !title.isEmpty, !category.isEmpty, !description.isEmpty else {
            showAlert = true
            return
        }
        
        
        let newCard = Card(id: nextCardID, name: name, image: defaultImage, title: title, category: category, descrip: description, price: price, status: "pending", editMode: true, expand: true)
        cards.append(newCard)
        resetFields()
        nextCardID+=1
    }

    private func resetFields() {
        title = ""
        category = ""
        description = ""
        priceString = ""
    }
}


struct MakeRequest_Previews: PreviewProvider {
    static var previews: some View {
        MakeRequest(cards: .constant([]))
    }
}
