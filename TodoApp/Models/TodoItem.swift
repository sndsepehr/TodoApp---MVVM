//
//  TodoItem.swift
//  TodoApp
//
//  Created by SDN SPR on 2/4/22.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func togleCompletion() -> TodoItem {
        return TodoItem(id: id, title: title, isCompleted: !isCompleted)
    }
}
