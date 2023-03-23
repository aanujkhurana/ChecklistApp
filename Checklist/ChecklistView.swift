//
//  SwiftUIView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

//list of items
let Checklists = [
    ["Checked","Get Grocceries"],["UnChecked","Water Plants"],["UnChecked","Assignment MAD"],["Checked","Online Course"],["Checked","Get Haircut"],["Checked","Quiz BigData"]
]



struct ChecklistView: View {
    var Checklist: [String]
    var body: some View {
        HStack{
            Text(Checklist[1])
                .font(.title3)
                .fontWeight(.medium)
                .padding(.vertical, 7.0)
            //ITEM NAME
            Spacer()
            if (Checklist[0] == "Checked") {
                Image(systemName: "checkmark.seal.fill").resizable().foregroundColor(Color(.systemGreen)).frame(width: 30, height: 30)}
            //CHECKMARK IMAGE
            }.onTapGesture {
            print("Pressed \(Checklist[1])")
        }
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}