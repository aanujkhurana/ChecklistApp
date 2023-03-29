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
    @State var name: String = ""
    @State var tasks: [Items] = []
    
    var body: some View {
            List {
                ForEach($checklist.items) {
                    $items in
                    HStack {
                        Text(items.name)
                        Spacer()
                        Image(systemName: items.status ? "checkmark" : "")
                    }
                }
            }.navigationTitle("title2")
    }
}

struct ChecklistView_Previews: PreviewProvider {
    @State static var model = DataModel()
    static var previews: some View {
        ContentView(model: $model)
    }
}
