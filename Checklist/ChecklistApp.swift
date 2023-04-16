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
    @StateObject var model: DataModel = DataModel.getDataModel() //classes to mainview
    var body: some Scene {
        WindowGroup {
            ChecklistsView(model: model) //class as observed object
        }
    }
}
