import SwiftUI

struct HomeView: View {

    @State private var searchText = ""

    var body: some View {

        NavigationStack {
            ScrollView {

                VStack(alignment: .leading, spacing: 20) {

                    // App Header
                    HStack {
                        Text("QUICK FIT")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.brown)

                        Spacer()

                        Image(systemName: "cart")
                            .font(.title)
                    }

                    // Welcome Section
                    VStack(alignment: .leading) {
                        Text("Find Your Perfect Style!")
                            .font(.title2)
                            .bold()

                        Text("Discover trendy clothes at affordable prices.")
                            .foregroundColor(.gray)
                    }

                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("Search for clothes...", text: $searchText)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)

                    // Categories
                    Text("Shop By Category")
                        .font(.title3)
                        .bold()

                    HStack {
                        CategoryView(name: "T-Shirts", icon: "tshirt")
                        CategoryView(name: "Jeans", icon: "figure.stand")
                        CategoryView(name: "Dresses", icon: "hanger")
                    }

                    // Products
                    Text("Popular Products")
                        .font(.title3)
                        .bold()

                    HStack(spacing: 15) {
                        ProductView(name: "Classic T-Shirt", price: "₹499")
                        ProductView(name: "Blue Jeans", price: "₹999")
                    }
                }
                .padding()
            }
            .background(Color.white)
        }
    }
}

// Category View
struct CategoryView: View {

    var name: String
    var icon: String

    var body: some View {
        VStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.brown)

            Text(name)
                .font(.caption)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.brown.opacity(0.1))
        .cornerRadius(10)
    }
}

// Product View
struct ProductView: View {

    var name: String
    var price: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            Image(systemName: "tshirt")
                .font(.system(size: 55))
                .foregroundColor(.brown)
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(Color.brown.opacity(0.1))
                .cornerRadius(10)

            Text(name)
                .fontWeight(.semibold)

            Text(price)
                .foregroundColor(.brown)

            Button("Add to Cart") {
                print("Product added to cart")
            }
            .padding(8)
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}