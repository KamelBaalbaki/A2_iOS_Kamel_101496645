//
//  ProductCard.swift
//  A2_iOS_Kamel_101496645
//
//  Created by Kamel Baalbaki on 2026-03-30.
//

import SwiftUI

struct ProductCard: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(product.name ?? "")
                .font(.title2)
                .bold()
            
            Text(product.desc ?? "")
                .font(.body)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            HStack {
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.headline)
                
                Spacer()
                
                Text(product.provider ?? "")
                    .font(.caption)
                    .padding(6)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(
            LinearGradient(
                colors: [Color.white, Color.gray.opacity(0.05)],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
    }
}
