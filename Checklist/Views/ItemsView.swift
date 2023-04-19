//
//  SwiftUIView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

//list of items

struct ItemsView: View {
    
    @ObservedObject var checklist: Checklist //checklist class
    
    var body: some View {
        VStack {
                TitleEditView(title: $checklist.title).padding()
                List {
                    ForEach(checklist.items){
                        item in itemRowView(item: item)
                    }
                    .onDelete(perform: checklist.deleteItem)
                    .onMove(perform: checklist.moveItem)
                    AddItemView(callback: checklist.addItem)
                } //list end
                .listStyle(.plain)
            } //vstack end
            .navigationTitle("📝")
            .navigationBarItems(leading:UndoResetButton(reset: resetList, undo: undoreset),
                                trailing: EditButton())
    }
    
// Reset items status function
        func resetList(){
            for i in 0..<checklist.items.count {
                checklist.items[i].reset() }
            print("ResetList called")
            saveData() }
// Undo Reset Function  `   `
    func undoreset(){
        for i in 0..<checklist.items.count {
            checklist.items[i].undoReset() }
        print("Undo called")
        saveData() }
}
