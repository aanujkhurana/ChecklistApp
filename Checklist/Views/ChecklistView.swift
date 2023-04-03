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
    @State var tempChecklist = Checklists(title: "", items: [])
    @State var hasAlert = false
    @State var status: Bool = false
    
    @Environment(\.editMode) var editMode
//    clear function
    func clearList(){
        tempChecklist.items = []
        print("clear List is called")
    }
    
//    add item function
    func addItem(_ itm: String) {
        if(itm != "") {
            let newItem = Items(name: itm, status: false)
            tempChecklist.items.append(newItem)
        } else {
            hasAlert = true
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                TitleEditView(title: $tempChecklist.title)
            }
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
                
            if(editMode?.wrappedValue == .active) {
                NewItemView(callback: addItem)}
            }

        }
        .navigationBarItems(leading:ClearButton(fun: clearList) ,trailing: EditButton()).padding(.leading)
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

