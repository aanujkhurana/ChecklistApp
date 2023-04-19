//
//  DataModel.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import Foundation

// Checklists Class //
/// List of checklists
class Checklist: Codable, Identifiable, ObservableObject {
    
    var id = UUID()
    @Published var title: String //checklist tilte
    @Published var items: [Item] //list of items

    init(id: UUID = UUID(), title: String, items: [Item]) {
        self.id = id
        self.title = title
        self.items = items
    }
//    to make checklist model codable
    enum CodingKeys: CodingKey {
        case title
        case items
    }
// Encode
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(items, forKey: .items)
    }

//    Decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        items = try container.decode([Item].self, forKey: .items)
    }
////   Items functions
    //Delete Item func
        func deleteItem(indexSet: IndexSet) {
            items.remove(atOffsets: indexSet)
            print("deleteItem called")
            saveData()}
    //Move Item func
        func moveItem(from: IndexSet, to: Int) {
            items.move(fromOffsets: from, toOffset: to)
            print("moveItem called")
            saveData()}
    //Add Item func
    /// add new items to items array
    /// - Parameter item: name of item with status false
    func addItem(_ item: String){
        let newItem = Item(name: item, status: false)
        items.append(newItem)
        print("AddItem called")
        saveData()
    }

}

// Items Class //
/// list of items inside checklist
class Item: Codable ,Identifiable, ObservableObject {
    var id = UUID()
    var name: String //item name
    @Published var status: Bool = false // to check uncheck items in checklist
    var preStatus: Bool = false // to save the previous value for undo

    init(id: UUID = UUID(), name: String, status: Bool) {
        self.id = id
        self.name = name
        self.status = status
    }
///    to make litem model codable
    enum CodingKeys: CodingKey {
        case name
        case status
    }
// Encode
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(status, forKey: .status)
    }
// Decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decode(Bool.self, forKey: .status)
    }

//// Item Function
    /// change all item status to false
        func reset() {
            preStatus = status
            status = false
        }
    /// undo reset function to previous satus of items
        func undoReset() {
            status = preStatus
        }
}


///TestData for testing///
// Create some test items
let item1 = Item(name: "Buy milk", status: false)
let item2 = Item(name: "Go for a run", status: true)
let item3 = Item(name: "Finish homework", status: false)
// Create a test checklist with the items
let testData = [
    Checklist(title: "Checklist1", items: [item1, item2]),
    Checklist(title: "Checklist2", items: [item3])
]

// Checklist Data model //
/// data model for view, write and load to file
class DataModel: Codable ,ObservableObject {
    
    @Published var checklists: [Checklist] // to refresh after change
    @Published var loadingCompleted = false // for loading
    
    static var model: DataModel?

    private init() {
        checklists = []
        load()
    }
    
    /// guarantee there is only one DataModel created.
    static func getDataModel()->DataModel {
        guard let md = DataModel.model else {
            let m = DataModel()
            DataModel.model = m
            return m
        }
        return md
    }

//    to make data model codable
    enum CodingKeys: CodingKey {
        case checklists
        case items
    }
// Encode
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(checklists, forKey: .checklists)
    }
// Decode
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        checklists = try container.decode([Checklist].self, forKey: .checklists)
    }
// to load file
    func getFile()->URL {
        let fname = "saveanywhere.json"
        let fm = FileManager.default
        let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        return url.appendingPathComponent(fname)
    }
// save data
    func save() {
        do{
            let url = getFile()
            let data = try JSONEncoder().encode(self)
            try data.write(to: url)
        } catch {
            print("save failed with error: \(error)")
        }
    }

    private func asyLoad() async ->DataModel? {
        do{
            let url = getFile()
            let datastr = try Data(contentsOf: url)
            let data = try JSONDecoder().decode(DataModel.self, from: datastr)
            return data
        }
        catch {
            print("load failed with error: \(error)")
        }
        return nil
    }
// load function for init
    func load() {
        Task {
            guard let data = await asyLoad() else {return}
/// withouth sleep, you can't observe the loading page...
            try? await Task.sleep(nanoseconds: 2000_000_000)
            DispatchQueue.main.async {
                self.checklists = data.checklists
                self.loadingCompleted = true //after delay loading is completed
            }

        }
    }
    
//// Checklist functions
//    Delete checklist func
    func deleteChecklist(indexSet: IndexSet) {
        checklists.remove(atOffsets: indexSet)
        print("deleteChecklist called")
        saveData()
    }
    //Move Checklist func
    func moveChecklist(from: IndexSet, to: Int) {
        checklists.move(fromOffsets: from, toOffset: to)
        print("moveChecklist called")
        saveData()
    }
    //add Checklist func
    /// adds new checklist to list of checklists
    func addChecklist() {
        let newChecklist = Checklist(title: "New Checklist", items: [])
        checklists.append(newChecklist)
        print("addChecklist called")
        saveData()
    }

}

//Save datamodel function
func saveData() {
    let model = DataModel.getDataModel()
    model.save()
}
