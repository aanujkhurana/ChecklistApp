//
//  ClearButton.swift
//  Checklist
//
//  Created by Anuj Khurana on 3/4/2023.
//

import SwiftUI

struct UndoResetButton: View {
    
    @Environment(\.editMode) var editMode
    
    var reset: () -> Void
    var undo: () -> Void
    @State var isPressed = true // Toggle the pressed state
    
    var body: some View {
        HStack{
            if(editMode?.wrappedValue == .active) {
                Button(action: {
                    if isPressed { reset() }
                    else { undo() }
                    isPressed.toggle() //change state
                },
                       label: {
                    if isPressed {
                        Text("Reset")
                            .padding(.leading)
                            .foregroundColor(.red)
                        Image(systemName: "arrow.uturn.backward").foregroundColor(.red)}
                    else {
                        Text("Undo")
                            .foregroundColor(.blue)
                            .padding(.leading)
                        Image(systemName: "arrow.uturn.forward")}
                })
            }
        } //Hstack end
    }
}


