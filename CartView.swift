import SwiftUI

struct CartView: View {

    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationStack {
            VStack {

                if cartManager.items.isEmpty {

                    Image(systemName: "cart")
                        .font(.system(size: 60))
                        .foregroundColor(.gray)

                    Text("Your Cart is Empty")
                        .font(.title2)
                        .bold()
                        .padding()

                    Text("Add some products to get started!")
                        .foregroundColor(.secondary)

                } else {

                    List {
                        ForEach(cartManager.items) { item in

                            HStack(spacing: 12) {

                                Image(systemName: item.product.image)
                                    .font(.largeTitle)
                                    .frame(width: 55, height: 55)
                                    .background(Color.gray.opacity(0.12))
                                    .cornerRadius(8)

                                VStack(alignment: .leading, spacing: 5) {

                                    Text(item.product.name)
                                        .font(.headline)

                                    Text("₹\(Int(item.product.price))")
                                        .foregroundColor(.secondary)

                                    HStack {
                                        Button {
                                            cartManager.updateQuantity(item, amount: -1)
                                        } label: {
                                            Image(systemName: "minus.circle")
                                        }

                                        Text("\(item.quantity)")

                                        Button {
                                            cartManager.updateQuantity(item, amount: 1)
                                        } label: {
                                            Image(systemName: "plus.circle")
                                        }
                                    }
                                }

                                Spacer()

                                Button {
                                    cartManager.removeFromCart(item)
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 6)
                        }
                    }

                    VStack(spacing: 12) {

                        HStack {
                            Text("Total Amount")
                                .font(.headline)

                            Spacer()

                            Text("₹\(Int(cartManager.totalPrice))")
                                .font(.headline)
                        }

                        Button {
                            print("Checkout button clicked")
                        } label: {
                            Text("Proceed to Checkout")
                                .bold()
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.brown)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("My Cart")
        }
    }
}