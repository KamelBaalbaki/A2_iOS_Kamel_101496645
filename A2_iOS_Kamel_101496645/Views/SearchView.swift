//
//  SearchView.swift
//  A2_iOS_Kamel_101496645
//
//  Created by Kamel Baalbaki on 2026-03-30.
//
import SwiftUI

struct SearchView: View {
    @ObservedObject var vm: ProductViewModel
    @State private var query = ""
    
    var body: some View {
        VStack {
            TextField("Search...", text: $query)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button("Search") {
                vm.search(query: query)
            }
            
            List(vm.products) { product in
                Text(product.name ?? "")
            }
        }
        .navigationTitle("Search")
    }
}
