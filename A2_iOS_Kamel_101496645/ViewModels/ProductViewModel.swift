//
//  ProductViewModel.swift
//  A2_iOS_Kamel_101496645
//
//  Created by Kamel Baalbaki on 2026-03-30.
//

import Foundation
import CoreData

class ProductViewModel: ObservableObject {
    let context = PersistenceController.shared.container.viewContext
    
    @Published var products: [Product] = []
    @Published var currentIndex: Int = 0
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            products = try context.fetch(request)
        } catch {
            print("Error fetching: \(error)")
        }
    }
    
    func addProduct(name: String, desc: String, price: Double, provider: String) {
        let newProduct = Product(context: context)
        newProduct.id = UUID()
        newProduct.name = name
        newProduct.desc = desc
        newProduct.price = price
        newProduct.provider = provider
        
        save()
    }
    
    func save() {
        do {
            try context.save()
            fetchProducts()
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    func nextProduct() {
        if currentIndex < products.count - 1 {
            currentIndex += 1
        }
    }
    
    func prevProduct() {
        if currentIndex > 0 {
            currentIndex -= 1
        }
    }
    
    func search(query: String) {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.predicate = NSPredicate(format: "name CONTAINS[c] %@ OR desc CONTAINS[c] %@", query, query)
        
        do {
            products = try context.fetch(request)
        } catch {
            print("Search error: \(error)")
        }
    }
}
