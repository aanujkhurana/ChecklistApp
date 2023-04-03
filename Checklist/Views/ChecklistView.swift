//
//  SwiftUIView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

//list of items

struct ChecklistView: View {
    
    @Binding var checklist: Checklists
    @State var tempChecklist = Checklists(name: "", items: [])
    @State var hasAlert = false
    @State var status: Bool = false
    
    
    var body: some View {
        VStack {
            List {
                ForEach($tempChecklist.items) {
                    $item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        if (item.status == true){
                            Image(systemName: "checkmark.seal.fill").foregroundColor(.green)
                        }
                    }.onTapGesture {
                        if (item.status != true){
                            item.status = true
                        }
                        else {item.status = false}
                        }
                }
                .onDelete(perform: deleteItem)
                .onMove(perform: moveItem)
            }

        }
        .navigationTitle(checklist.name)
        .navigationBarItems(trailing: EditButton())
        .onAppear{
            tempChecklist = checklist}
        .onDisappear{
            checklist = tempChecklist}
    }


    
    //    Items functions
    //Delete
        func deleteItem(indexSet: IndexSet) {
            checklist.items.remove(atOffsets: indexSet)
        }
    //Move
        func moveItem(from: IndexSet, to: Int) {
            checklist.items.move(fromOffsets: from, toOffset: to)
        }
    //Add
//        func addItem() {
//            let newItem = Checklists(name: checklist.name, items: [Items(name: "", status: false)])
//            checklist.items.append(newItem)
//            model.save()
//        }

}

struct ChecklistView_Previews: PreviewProvider {
    @State static var model = DataModel()
    static var previews: some View {
        ContentView(model: $model)
    }
}

