//
//  TitleEditView.swift
//  Checklist
//
//  Created by Anuj Khurana on 3/4/2023.
//

import SwiftUI

struct TitleEditView: View {
    
    @Binding var title: String
    @State var newtitle: String = ""
    
    @Environment(\.editMode) var editMode
    
    var body: some View {
        HStack{
            if(editMode?.wrappedValue == .active) {
                HStack{
                    Image(systemName: "pencil.line")
                    TextField("input new value:", text: $newtitle)
                    Button("Cancel"){
                        newtitle = title
                    }
                }.onAppear{
                    newtitle = title
                }.onDisappear{
                    title = newtitle
                }
            }else {
                Text(title)
            }
        }
    }
}
