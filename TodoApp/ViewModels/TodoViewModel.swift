//
//  TodoViewModel.swift
//  TodoApp
//
//  Created by SDN SPR on 2/4/22.
//

import Foundation

/*
 CRUD Functions
 
 Create
 Read
 Update
 Delete
 
 */

class TodoViewModel: ObservableObject {
    
    @Published var listItems: [TodoItem] = [] {
        didSet {
            saveData()
        }
    }
    
    let listItemsKey = "list_item_key"
    
    init() {
        getItems()
    }
    
    private func getItems() {
      guard
        
        let data = UserDefaults.standard.data(forKey: listItemsKey),
        let items = try? JSONDecoder().decode([TodoItem].self, from: data)
        else { return }
        self.listItems = items
        
    }

    func deleteItem(_ indexSet: IndexSet) {
        listItems.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        listItems.move(fromOffsets: from, toOffset: to)
    }
    func addItem(_ title: String) {
        self.listItems.append(TodoItem(title: title))
    }
    func updateItem(_ item: TodoItem) {
        if let index = listItems.firstIndex(where: { $0.id == item.id}) {
            listItems[index] = item.togleCompletion()
        }
    }
    
    func saveData() {
        if let encodeData = try? JSONEncoder().encode(listItems) {
            UserDefaults.standard.set(encodeData, forKey: listItemsKey)
        }
    }
}
