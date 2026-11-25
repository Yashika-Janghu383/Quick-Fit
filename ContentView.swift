import SwiftUI

struct ContentView: View {

    @State private var selectedTab = 0

    var body: some View {

        TabView(selection: $selectedTab) {

            // Home Screen
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            // Products Screen
            ProductView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Products")
                }
                .tag(1)

            // Cart Screen
            CartView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(2)

            // Profile Screen
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
        .tint(.brown)
    }
}

#Preview {
    ContentView()
}