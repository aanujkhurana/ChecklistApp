//
//  NewItemView.swift
//  Checklist
//
//  Created by Anuj Khurana on 3/4/2023.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.editMode) var editMode
    
    var callback:(String) -> Void
    
    @State var item = "" // to addnew item
    @State var alertshow: Bool = false //for alret show alert on true
    var alertTitle: String = "please entre a vaild item" //alreat text
    
    var body: some View {
        if(editMode?.wrappedValue == .active) {
            HStack{
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(Color(.systemGreen))
                    .frame(width: 25, height: 25)
                    .onTapGesture {
                        if textcheck() //to check and show alert
                        { callback(item)
                            item = "" }
                    }
                TextField("Type Item here: ", text: $item)
                    .padding(8)
                    .fontWeight(.medium)
                    .font(.system(size: 18))
            }.alert(isPresented: $alertshow, content: getAlert) //show alert when true
        }
    }

//// Alert functions
// input check function
    func textcheck() -> Bool {
        if item.count < 3 {
            alertshow.toggle()
            return false
        }
        return true
    }
// get alert after check function
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}
