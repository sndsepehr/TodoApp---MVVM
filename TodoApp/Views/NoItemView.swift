//
//  NoItemView.swift
//  TodoApp
//
//  Created by SDN SPR on 2/4/22.
//

import SwiftUI

struct NoItemView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
            Text("Not Items Found")
                .font(.title)
        
            Text("There is no item added yet. If you are a productive person, then add something")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                
                
                NavigationLink {
                    AddItemView()
                } label: {
                    Text("Add New Todo")
                        .font(.headline)
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(40)
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        NoItemView()
                .navigationTitle("A view")
        }
        
    }
}
