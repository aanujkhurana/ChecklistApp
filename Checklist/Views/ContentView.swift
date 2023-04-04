//
//  ContentView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var model: DataModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                List{
                    ForEach($model.checklists){
                        $checklist in
                        NavigationLink(destination: ChecklistView(checklist: $checklist)){
                            Text(checklist.title)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                        }.padding(8)
                    }.onDelete(perform: deleteChecklist)
                        .onMove(perform: moveChecklist)
                }.navigationTitle("My Checklists 📝")
                 .navigationBarItems(leading: Button("Add +"){
                        addChecklist()
                    }, trailing: EditButton() )
                 .padding(.top,2)
                 .listStyle(.automatic)
                 .background(.white)
            }
        }.onAppear{
            model.load()
        }
        .onDisappear{
            model.save()
        }
    }
    //    Checklist functions
    //Delete
        func deleteChecklist(indexSet: IndexSet) {
            model.checklists.remove(atOffsets: indexSet)
        }
    //Move
        func moveChecklist(from: IndexSet, to: Int) {
            model.checklists.move(fromOffsets: from, toOffset: to)
        }
    //add
        func addChecklist() {
            let newChecklist = Checklists(title: "New Checklist", items: [Items(name: "", status: false)])
            model.checklists.append(newChecklist)
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        @State static var model = DataModel()
        static var previews: some View {
            ContentView(model: $model)
        }
    }

