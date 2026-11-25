import SwiftUI

@main
struct QuickFitApp: App {

    @StateObject var cartManager = CartManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}