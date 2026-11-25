import SwiftUI

// Product Information
struct Product: Identifiable {
    var id = UUID()
    var name: String
    var price: Double
    var category: String
    var image: String
}

// Cart Item
struct CartItem: Identifiable {
    var id = UUID()
    var product: Product
    var quantity: Int
}

// Shopping Cart Manager
class CartManager: ObservableObject {

    @Published var items: [CartItem] = []

    // Add Product
    func addToCart(_ product: Product) {

        if let index = items.firstIndex(where: {
            $0.product.id == product.id
        }) {
            items[index].quantity += 1

        } else {
            items.append(
                CartItem(product: product, quantity: 1)
            )
        }
    }

    // Total Price
    var totalPrice: Double {
        items.reduce(0) {
            $0 + ($1.product.price * Double($1.quantity))
        }
    }

    // Remove Product
    func removeFromCart(_ item: CartItem) {
        items.removeAll {
            $0.id == item.id
        }
    }

    // Change Quantity
    func updateQuantity(_ item: CartItem, amount: Int) {

        guard let index = items.firstIndex(where: {
            $0.id == item.id
        }) else {
            return
        }

        let newQuantity = items[index].quantity + amount

        if newQuantity > 0 {
            items[index].quantity = newQuantity
        } else {
            items.remove(at: index)
        }
    }
}