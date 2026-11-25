import SwiftUI

struct ProfileView: View {

    @State private var userName = "Your Name"
    @State private var email = "yourname@email.com"

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(spacing: 25) {

                    // Profile Heading
                    Text("My Profile")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.brown)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    // User Information
                    VStack(spacing: 12) {

                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.brown)

                        Text(userName)
                            .font(.title2)
                            .bold()

                        Text(email)
                            .foregroundColor(.gray)

                        Button("Edit Profile") {
                            userName = "Quick Fit User"
                            email = "user@email.com"
                        }
                        .padding(.horizontal, 25)
                        .padding(.vertical, 10)
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown.opacity(0.08))
                    .cornerRadius(15)

                    // Profile Options
                    VStack(spacing: 0) {

                        ProfileOption(
                            icon: "bag",
                            title: "My Orders"
                        )

                        ProfileOption(
                            icon: "heart",
                            title: "My Wishlist"
                        )

                        ProfileOption(
                            icon: "location",
                            title: "Delivery Address"
                        )

                        ProfileOption(
                            icon: "creditcard",
                            title: "Payment Methods"
                        )

                        ProfileOption(
                            icon: "info.circle",
                            title: "About Quick Fit"
                        )

                        ProfileOption(
                            icon: "questionmark.circle",
                            title: "Help & Support"
                        )
                    }
                    .background(Color.gray.opacity(0.08))
                    .cornerRadius(15)

                    // Logout Button
                    Button {
                        print("Logout button clicked")
                    } label: {

                        Text("Log Out")
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.08))
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
            .background(Color.white)
           
        }
    }
}

// Profile Option Design
struct ProfileOption: View {

    var icon: String
    var title: String

    var body: some View {

        HStack(spacing: 15) {

            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.brown)
                .frame(width: 30)

            Text(title)
                .foregroundColor(.black)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }
}

// Preview
#Preview {
    ProfileView()
}

// Required by Coddy preview
struct ContentView: View {

    var body: some View {
        ProfileView()
    }
}
