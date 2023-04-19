//
//  itemRowView.swift
//  Checklist
//
//  Created by Anuj Khurana on 15/4/2023.
//

import SwiftUI

struct itemRowView: View {
    @ObservedObject var item: Item
    var body: some View {
        HStack {
            Text(item.name.capitalized)
                .foregroundColor(.accentColor)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .padding(6)
            Spacer()
            if (item.status == true){
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .foregroundColor(Color(.systemGreen))
                    .frame(width: 25, height: 25)}
        } //Hstack end
        .padding(4)
        .onTapGesture {
        if (item.status != true){item.status = true
            print("Item Status Changed")
            saveData()
            //save after changing status
        }
        else {item.status = false
            saveData()}
        }
    }
}

