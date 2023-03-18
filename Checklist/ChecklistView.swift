//
//  SwiftUIView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

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
            Spacer()
            if (Checklist[0] != "UnChecked") {
                Image(systemName: "checkmark.seal.fill").resizable().foregroundColor(Color("AccentColor")).frame(width: 30, height: 30)}
        }
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
