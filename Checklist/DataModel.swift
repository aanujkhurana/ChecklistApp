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
    var items: [Items]
}

// Checklist items
struct Items: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var status: Bool
}

// TestData
var testData = [
    Checklists(title: "Checklist1", items:[Items(name: "Item121", status: false), Items(name: "Item909", status: true)]),
    Checklists(title: "Checklist2", items: [Items(name: "dishes", status: false), Items(name: "shopping", status: true)])
]


// Wrtie and load to file
func getFile() -> URL? {
    let fileName="checklists.json"
    let fm=FileManager.default
    guard let url=fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first
    else{ return nil}
    return url.appendingPathComponent(fileName)
}


// DataModel
struct DataModel: Codable {
    var checklists: [Checklists] = []
    init() {
        checklists = []
        load()
    }
//   function to load file
    mutating func load() {
        guard let url=getFile(),
              let data=try? Data(contentsOf: url),
              let datamodel=try? JSONDecoder().decode(DataModel.self, from: data)
        else{ self.checklists=testData
            return
        }
        self.checklists=datamodel.checklists
    }
//    function to save file
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


