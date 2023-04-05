//
//  DataModel.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import Foundation

//Checklists
struct Checklists: Codable, Hashable, Identifiable {
    var id = UUID()
    var title: String
    var items: [Items] //list of items
}

// Checklist items
struct Items: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var status: Bool // to check uncheck items in checklist
}

//TestData for testing
var testData = [
    Checklists(title: "Checklist1", items:[Items(name: "Item121", status: false), Items(name: "Item909", status: true)]),
    Checklists(title: "Checklist2", items: [Items(name: "dishes", status: false), Items(name: "shopping", status: true)])
]

// DataModel
struct DataModel: Codable {

    var checklists: [Checklists] = []
    
    init() {
        checklists = []
        load()
    }

//    LOAD function
    mutating func load() {
        guard let url=getFile(),
              let data=try? Data(contentsOf: url),
              let datamodel=try? JSONDecoder().decode(DataModel.self, from: data)
        else { self.checklists = testData
            return
        }
        self.checklists = datamodel.checklists
    }
//    GETFILE function
    func getFile () -> URL? {
        let filename = "saveload.json"
        let fm = FileManager.default
        guard let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.allDomainsMask).first
        else {
            return nil
        }
        return url.appendingPathComponent(filename)
    }
//    SAVE function
    func save() {
        guard let url=getFile(),
              let data=try?
                JSONEncoder().encode(self)
        else{
            return
        }
        try? data.write(to: url)
    }
}


