//
//  ContentView.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

struct ChecklistsView: View {
    
    @ObservedObject var model: DataModel //class datamodel as stateobject from main
    
    var body: some View {
        if(model.loadingCompleted){
            NavigationView {
                VStack (alignment: .leading) {
                    List{
                        ForEach(model.checklists){
                            checklist in
                            NavigationLink(destination: ItemsView(checklist: checklist)){
                                checklistRowView(checklist: checklist)
                            }.padding(4)
                        }.onDelete(perform: model.deleteChecklist)
                            .onMove(perform: model.moveChecklist)
                    } //list end
                    .navigationTitle("📝 My Checklists")
                    .navigationBarItems(leading: Button("Add +"){model.addChecklist()},trailing: EditButton())
                    .padding(.top,2)
                    .listStyle(.automatic)
                    .background(.white)
                } //vstack end
            }
        }
            else{ SplashScreenView() }
        }
    }

