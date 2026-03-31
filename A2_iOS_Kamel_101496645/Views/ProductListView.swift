//
//  ProductListView.swift
//  A2_iOS_Kamel_101496645
//
//  Created by Kamel Baalbaki on 2026-03-30.
//

import SwiftUI
import CoreData

struct ProductListView: View {
    @ObservedObject var vm: ProductViewModel
    
    var body: some View {
        List {
            ForEach(vm.products) { product in
                ProductCard(product: product)
            }
            .onDelete { indexSet in
                deleteProduct(at: indexSet)
            }
        }
        .listStyle(.plain)
        .navigationTitle("All Products")
    }
    
    func deleteProduct(at offsets: IndexSet) {
        for index in offsets {
            let product = vm.products[index]
            vm.context.delete(product)
        }
        
        vm.save()
    }
}
