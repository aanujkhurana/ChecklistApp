//
//  ClearButton.swift
//  Checklist
//
//  Created by Anuj Khurana on 3/4/2023.
//

import SwiftUI

struct ClearButton: View {
    @Environment(\.editMode) var editMode
    var fun: () -> Void
    var body: some View {
        HStack{
            if(editMode?.wrappedValue == .active) {
                Button("Clear"){
                    fun()
                }
            }
        }
    }
}
