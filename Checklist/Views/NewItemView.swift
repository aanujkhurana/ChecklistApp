//
//  NewItemView.swift
//  Checklist
//
//  Created by Anuj Khurana on 3/4/2023.
//

import SwiftUI

struct NewItemView: View {
    
    @Environment(\.editMode) var editMode
    
    var callback:(String) -> Void
    
    @State var item = ""
    
    var body: some View {
        VStack {
            if(editMode?.wrappedValue == .active) {
                HStack{
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundColor(Color(.systemGreen))
                        .frame(width: 25, height: 25)
                        .onTapGesture {
                        callback(item)
                        item = ""
                    }
                    TextField("Type Item here: ", text: $item)
                        .padding(8)
                        .fontWeight(.medium)
                        .font(.system(size: 18))
                }
            }
        }
    }
}
