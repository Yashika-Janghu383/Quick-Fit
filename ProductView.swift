import SwiftUI

struct ProductView: View {

    @EnvironmentObject var cartManager: CartManager

    let products = [
        Product(name: "Classic T-Shirt", price: 499, category: "T-Shirts", image: "tshirt"),
        Product(name: "Blue Jeans", price: 999, category: "Jeans", image: "figure.stand"),
        Product(name: "Casual Jacket", price: 1499, category: "Jackets", image: "jacket"),
        Product(name: "White Shirt", price: 699, category: "Shirts", image: "tshirt"),
        Product(name: "Black T-Shirt", price: 549, category: "T-Shirts", image: "tshirt"),
        Product(name: "Denim Jeans", price: 1099, category: "Jeans", image: "figure.stand")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {

                    Text("Our Collection")
                        .font(.title)
                        .bold()

                    LazyVGrid(
                        columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ],
                        spacing: 16
                    ) {
                        ForEach(products) { product in

                            VStack(alignment: .leading, spacing: 10) {

                                Image(systemName: product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 90)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.12))
                                    .cornerRadius(12)

                                Text(product.name)
                                    .font(.headline)

                                Text("₹\(Int(product.price))")
                                    .foregroundColor(.secondary)

                                Button {
                                    cartManager.addToCart(product)
                                } label: {
                                    Text("Add to Cart")
                                        .font(.subheadline)
                                        .bold()
                                        .frame(maxWidth: .infinity)
                                        .padding(10)
                                        .background(Color.brown)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                            }
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: .gray.opacity(0.15), radius: 4)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Products")
        }
    }
} 