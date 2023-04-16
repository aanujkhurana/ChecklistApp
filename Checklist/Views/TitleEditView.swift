//
//  TitleEditView.swift
//  Checklist
//
//  Created by Anuj Khurana on 3/4/2023.
//

import SwiftUI

struct TitleEditView: View {
    
    @Environment(\.editMode) var editMode
    
    @Binding var title: String //binding to update title in itemview
    @State var newtitle: String = ""
    
    var body: some View {
        VStack{
            if(editMode?.wrappedValue == .active) {
                HStack{
                    Image(systemName: "pencil")
                    TextField("input new value:", text: $newtitle)
                    .font(.title)
                    .fontWeight(.medium)
                    Button("Cancel"){ newtitle = title }
                } //Hstack end
                .onAppear{ newtitle = title }
                 .onDisappear{ title = newtitle
                     saveData()
                     // save newtitle after changing
                 }.padding(.leading)
            }
            else { Text(title)
                    .font(.title)
                    .fontWeight(.medium)
            }
        }
    }
}
