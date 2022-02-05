//
//  ListView.swift
//  TodoApp
//
//  Created by SDN SPR on 2/4/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var todoViewModel: TodoViewModel
    
    var body: some View {
        
        ZStack {
            if todoViewModel.listItems.isEmpty {
                NoItemView()
            } else {
                List {
                    ForEach(todoViewModel.listItems) { item in
                        ListViewRow(todoItem: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    todoViewModel.updateItem(item)
                                }
                            }
                    }
                    .onDelete(perform: todoViewModel.deleteItem)
                    .onMove(perform: todoViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Todo List")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing: NavigationLink("Add", destination: AddItemView())
                )
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        NavigationView {
            ListView()
        }
        .environmentObject(TodoViewModel())
        .colorScheme(.dark)
.previewInterfaceOrientation(.portrait)
            
            NavigationView {
                ListView()
            }
            .environmentObject(TodoViewModel())
            .colorScheme(.light)
        }
    }
}
