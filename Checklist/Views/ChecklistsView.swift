//
//  ContentView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

struct ChecklistsView: View {
    
    @Binding var model: DataModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                List{
                    ForEach($model.checklists){
                        $checklist in
                        NavigationLink(destination: ItemsView(model: $model, checklist: $checklist)){
                            Text(checklist.title)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                        }.padding(4)
                    }.onDelete(perform: deleteChecklist)
                     .onMove(perform: moveChecklist)
                }.navigationTitle("📝 My Checklists")
                 .navigationBarItems(leading: Button("Add +"){addChecklist()},trailing: EditButton())
                 .padding(.top,2)
                 .listStyle(.automatic)
                 .background(.white)
            }
        }.onAppear{}
        .onDisappear{model.save()}
    }
    
    //    Checklist functions
    //Delete func
    func deleteChecklist(indexSet: IndexSet) {
        model.checklists.remove(atOffsets: indexSet)
        model.save()
        print("deleteChecklist called")
    } // need to save model after it is changed.
        
    //Move func
    func moveChecklist(from: IndexSet, to: Int) {
        model.checklists.move(fromOffsets: from, toOffset: to)
        model.save()
        print("moveChecklist called")
    } // need to save model after it is changed.
        
    //add func
    func addChecklist() {
        let newChecklist = Checklists(title: "New Checklist", items: [])
        model.checklists.append(newChecklist)
        model.save()
        print("addChecklist called")
    } // need to save model after it is changed.
}
    

//Preview Canvas
    struct ContentView_Previews: PreviewProvider {
        @State static var model = DataModel()
        static var previews: some View {
            ChecklistsView(model: $model)
        }
    }

