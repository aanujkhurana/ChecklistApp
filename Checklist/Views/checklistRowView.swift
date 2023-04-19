//
//  checklistRowView.swift
//  Checklist
//
//  Created by Anuj Khurana on 15/4/2023.
//

import SwiftUI

struct checklistRowView: View {
    @ObservedObject var checklist: Checklist
    var body: some View {
        Text(checklist.title)
            .foregroundColor(.accentColor)
            .font(.system(size: 20))
            .fontWeight(.medium)
    }
}
