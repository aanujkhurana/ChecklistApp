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
            VStack {
                List{
                    ForEach($model.checklists, id: \.self){
                        $checklist in
                        NavigationLink(destination: ChecklistView(checklist: $checklist)){
                            Text(checklist.name) // CHECKLISTS NAME
                        }
                    }
                }.navigationTitle("title")
            }
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        @State static var model = DataModel()
        static var previews: some View {
            ContentView(model: $model)
        }
    }

