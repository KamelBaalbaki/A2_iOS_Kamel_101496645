//
//  AddProductView.swift
//  A2_iOS_Kamel_101496645
//
//  Created by Kamel Baalbaki on 2026-03-30.
//
import SwiftUI

struct AddProductView: View {
    @ObservedObject var vm: ProductViewModel
    
    @State private var name = ""
    @State private var desc = ""
    @State private var price = ""
    @State private var provider = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Description", text: $desc)
            TextField("Price", text: $price)
            TextField("Provider", text: $provider)
            
            Button("Add Product") {
                vm.addProduct(
                    name: name,
                    desc: desc,
                    price: Double(price) ?? 0,
                    provider: provider
                )
            }
        }
        .navigationTitle("Add Product")
    }
}
