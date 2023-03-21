//
//  DataModel.swift
//  Checklist
//
//  Created by Anuj Khurana on 18/3/2023.
//

import Foundation

struct testChecklist {
    var item: String
    var status: String
}

var testData = [
    testChecklist(item: "Groceries", status: "Checked"),
    testChecklist(item: "Dish Washer", status: "UnChecked"),
    testChecklist(item: "Plans", status: "Checked")
]

func getChecklistItem (_ int: Int) -> (String,String) {
    return (testData[int].item, testData[int].status)
}
