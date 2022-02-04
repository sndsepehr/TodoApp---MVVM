//
//  AddItemView.swift
//  TodoApp
//
//  Created by SDN SPR on 2/4/22.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoViewModel: TodoViewModel
    @State var text: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Add a new task...", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.4))
                    .cornerRadius(10)
                
                Button {
                    // Save item when Save button pressed
                    saveButtonClicked()
                    
                } label: {
                    Text("Save".uppercased())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                        .font(.headline)
                }
            }
            .padding(14)
        }
        .navigationTitle("Add and item ✐")
        .alert(isPresented: $showAlert, content: getAlert)
        
    }
}

extension AddItemView {
    
    var isTextIsApproporiate: Bool {
        return text.trimmingCharacters(in: .whitespaces).count > 3
    }
    
    func saveButtonClicked() {
        if isTextIsApproporiate {
            todoViewModel.addItem(text)
            presentationMode.wrappedValue.dismiss()
        } else {
            alertTitle = "Todo should be greater than 3 characters"
            showAlert.toggle()
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItemView()
        }
    }
}
