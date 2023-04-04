//
//  SwiftUIView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

//list of items

struct ItemsView: View {
    
    @Binding var model: DataModel
    @Binding var checklist: Checklists
    @State var tempChecklist = Checklists(title: "", items: [])
    @State var originalChecklist = Checklists(title: "", items: [])
    @State var hasAlert = false
    @State private var textfieldtext: String = ""
    
    @Environment(\.editMode) var editMode
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack  {
                //in edit mode
                if(editMode?.wrappedValue == .active) {
                    TitleEditView(title: $tempChecklist.title)}
                else {
                    Text(tempChecklist.title.capitalized)
                    .font(.title)
                    .fontWeight(.medium)}
            }.padding(10)
            Spacer()
            HStack {
                List {
                    ForEach($tempChecklist.items) {
                        $item in
                        HStack {
                            Text(item.name.capitalized)
                                .foregroundColor(.accentColor)
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                                .padding(8)
                            Spacer()
                            if (item.status == true){
                                Image(systemName: "checkmark.seal.fill")
                                    .resizable()
                                    .foregroundColor(Color(.systemGreen))
                                    .frame(width: 25, height: 25)}
                        }.onTapGesture {
                            if (item.status != true){item.status = true
                                print("Item Status Changed")
                            }
                            else {item.status = false}}
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                    //in edit mode
                    if(editMode?.wrappedValue == .active) {
                        AddItemView(callback: addItem)}
                    else {
                        HStack{
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundColor(Color(.systemGreen))
                                .frame(width: 25, height: 25)
                                .onTapGesture {
                                    addItem("\(textfieldtext)")
                                    textfieldtext = "" }
                            TextField("Type Item here:", text: $textfieldtext)}
                        .padding(10)}
                }
                .listStyle(.plain)
            }
            .navigationBarItems(leading:UndoResetButton(reset: resetList, undo: undoreset) ,trailing: EditButton()).padding(.leading,40)
            .onAppear{tempChecklist = checklist}
            .onDisappear{
                checklist = tempChecklist
                model.save()} // need to save model after it is changed.
        }
    }

///////   Items functions
    //Delete func
        func deleteItem(indexSet: IndexSet) {
            tempChecklist.items.remove(atOffsets: indexSet)
            print("deleteItem called")
        }
    //Move func
        func moveItem(from: IndexSet, to: Int) {
            tempChecklist.items.move(fromOffsets: from, toOffset: to)
            print("moveItem called")
        }
    //Add func
        func addItem(_ item: String) {
            if(item != "") {
                let newItem = Items(name: item, status: false)
                tempChecklist.items.append(newItem)}
            else {hasAlert = true}
            print("AddItem called")
        }
    // Reset function
        func resetList(){
            originalChecklist = tempChecklist
            for i in 0..<tempChecklist.items.count {
                tempChecklist.items[i].status = false}
            print("ResetList called")
        }
    // Undo Function
    func undoreset(){tempChecklist = originalChecklist
        print("Undo called")
    }
}


//Preview Canvas
struct ChecklistView_Previews: PreviewProvider {
    @State static var model = DataModel()
    static var previews: some View {
        ChecklistsView(model: $model)
    }
}

