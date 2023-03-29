//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import SwiftUI

//Main
@main
struct ChecklistApp: App {
    @State var model: DataModel = DataModel() //create state for binding
    var body: some Scene {
        WindowGroup {
            ContentView(model: $model) //binding
        }
    }
}
