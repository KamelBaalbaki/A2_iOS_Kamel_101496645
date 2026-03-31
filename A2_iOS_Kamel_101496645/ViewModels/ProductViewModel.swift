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
    
    func seedDataIfNeeded() {
        if products.isEmpty {
            let sampleProducts = [
                ("iPhone 15", "Apple smartphone", 1200, "Apple"),
                ("MacBook Air", "Lightweight laptop", 1500, "Apple"),
                ("Galaxy S23", "Samsung flagship", 1100, "Samsung"),
                ("AirPods", "Wireless earbuds", 250, "Apple"),
                ("PlayStation 5", "Gaming console", 700, "Sony"),
                ("Xbox Series X", "Gaming console", 650, "Microsoft"),
                ("iPad Pro", "Tablet device", 1300, "Apple"),
                ("Dell XPS", "Premium laptop", 1400, "Dell"),
                ("Surface Pro", "2-in-1 laptop", 1350, "Microsoft"),
                ("Google Pixel", "Android phone", 900, "Google")
            ]
            
            for p in sampleProducts {
                addProduct(name: p.0, desc: p.1, price: Double(p.2), provider: p.3)
            }
        }
    }}
