//
//  ProductDetailView.swift
//  A2_iOS_Kamel_101496645
//
//  Created by Kamel Baalbaki on 2026-03-30.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var vm = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                if vm.products.count > 0 {
                    let product = vm.products[vm.currentIndex]
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.name ?? "")
                            .font(.title)
                            .bold()
                        
                        Text(product.desc ?? "")
                            .foregroundColor(.gray)
                        
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.headline)
                        
                        Text("Provider: \(product.provider ?? "")")
                            .font(.subheadline)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                }
                
                HStack {
                    Button("Previous") {
                        vm.prevProduct()
                    }
                    
                    Button("Next") {
                        vm.nextProduct()
                    }
                }
                
                NavigationLink("View All Products") {
                    ProductListView(vm: vm)
                }
                
                NavigationLink("Add Product") {
                    AddProductView(vm: vm)
                }
                
                NavigationLink("Search") {
                    SearchView(vm: vm)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Products")
        }
    }
}
