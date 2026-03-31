//
//  ProductListView.swift
//  A2_iOS_Kamel_101496645
//
//  Created by Kamel Baalbaki on 2026-03-30.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var vm: ProductViewModel
    
    var body: some View {
        List {
            ForEach(vm.products) { product in
                VStack(alignment: .leading) {
                    Text(product.name ?? "")
                        .font(.headline)
                    
                    Text(product.desc ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("All Products")
    }
}
