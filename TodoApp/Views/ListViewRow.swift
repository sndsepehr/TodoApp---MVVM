//
//  ListRowView.swift
//  TodoApp
//
//  Created by SDN SPR on 2/4/22.
//

import SwiftUI

struct ListViewRow: View {
    var todoItem: TodoItem
        
    var body: some View {
        HStack {
            Image(systemName: todoItem.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(todoItem.isCompleted ? .green : .red)
            Text(todoItem.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static let todo1 = TodoItem(title: "item 1", isCompleted: false)
    static let todo2 = TodoItem(title: "item 2", isCompleted: true)
    static var previews: some View {
        Group {
            ListViewRow(todoItem: todo1)
            ListViewRow(todoItem: todo2)
        }
        .previewLayout(.sizeThatFits)
    }
}
