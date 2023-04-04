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
    @State private var textfieldtext: String = ""
    
    @Environment(\.editMode) var editMode
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack  {
                if(editMode?.wrappedValue == .active) {
                    TitleEditView(title: $tempChecklist.title)
                }
                else {
                    Text(tempChecklist.title)
                    .font(.title)
                    .fontWeight(.medium)}
            }.padding(10)
            Spacer()
            HStack {
                List {
                    ForEach($tempChecklist.items) {
                        $item in
                        HStack {
                            Text(item.name)
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                                .padding(8)
                            Spacer()
                            if (item.status == true){
                                Image(systemName: "checkmark.seal.fill")
                                    .resizable().foregroundColor(Color(.systemGreen)).frame(width: 25, height: 25)
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
                        NewItemView(callback: addItem)
                    }
                    else {
                        HStack{
                            Image(systemName: "plus.circle")
                                .resizable()
                                .foregroundColor(Color(.systemGreen))
                                .frame(width: 25, height: 25)
                                .onTapGesture {
                                    addItem("\(textfieldtext)")
                                        textfieldtext = ""
                                    }
                            TextField("Type Item here:", text: $textfieldtext)
                            }.padding(10)}
                }.listStyle(.plain)
            }

        }
        .navigationBarItems(leading:ClearButton(fun: clearList) ,trailing: EditButton()).padding(.leading)
        .onAppear{
            tempChecklist = checklist}
        .onDisappear{
            checklist = tempChecklist}
    }


    
///////    Items functions
    //Delete
        func deleteItem(indexSet: IndexSet) {
            tempChecklist.items.remove(atOffsets: indexSet)
        }
    //Move
        func moveItem(from: IndexSet, to: Int) {
            tempChecklist.items.move(fromOffsets: from, toOffset: to)
        }
    //Add
        func addItem(_ item: String) {
            if(item != "") {
                let newItem = Items(name: item, status: false)
                tempChecklist.items.append(newItem)
            } else {
                hasAlert = true
            }
        }
    // Clear function
        func clearList(){
            tempChecklist.items = []
            print("clear List is called")
        }
    
//    func removeticks() {
//        HStack {
//            ForEach($tempChecklist.items, id: \.self) {
//                $item in
//                HStack {
//                    if (item.status == true) {
//                        item.status = false
//                    }
//            }}
//        }
//    }
}

struct ChecklistView_Previews: PreviewProvider {
    @State static var model = DataModel()
    static var previews: some View {
        ContentView(model: $model)
    }
}

