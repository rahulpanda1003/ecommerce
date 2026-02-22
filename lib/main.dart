import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickCommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFFF00), // Vibrant Yellow
        scaffoldBackgroundColor: const Color(0xFFF9F9F7),
        fontFamily: 'sans-serif',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFFF00)),
      ),
      home: const LoginScreen(),
    );
  }
}

// --- Navigation Wrapper ---
class MainNavigationWrapper extends StatefulWidget {
  final int initialIndex;
  const MainNavigationWrapper({super.key, this.initialIndex = 0});

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  late int _selectedIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          CategoriesScreen(),
          CartScreen(),
          OrdersScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFE6E600),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

// --- 1. Login Screen ---
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFFFFF00),
              child: Icon(Icons.shopping_cart, color: Colors.black, size: 40),
            ),
            const SizedBox(height: 20),
            const Text("QuickCommerce", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Groceries at your doorstep", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://images.unsplash.com/photo-1542838132-92c53300491e?q=80&w=400',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                hintText: "name@example.com",
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter OTP",
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFFF00),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainNavigationWrapper())),
              child: const Text("Login →", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen())),
              child: const Text("New here? Create Account", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

// --- 1.5 Sign Up Screen ---
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFFFFF00),
                  child: Icon(Icons.person_add, color: Colors.black, size: 40),
                ),
                const SizedBox(height: 20),
                const Text("Create Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const Text("Join QuickCommerce today", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFF00),
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainNavigationWrapper())),
                  child: const Text("Sign Up", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                  child: const Text("Already have an account? Login", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- 2. Home Screen ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DELIVERING TO", style: TextStyle(fontSize: 10, color: Colors.grey)),
            Text("Home - 123 Street, NY", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 10),
          CircleAvatar(radius: 18, backgroundColor: Colors.amber),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search for groceries, snacks...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(label: "Vegetables", icon: Icons.leaderboard, isSelected: true),
                  CategoryItem(label: "Fruits", icon: Icons.apple),
                  CategoryItem(label: "Snacks", icon: Icons.cookie),
                  CategoryItem(label: "Dairy", icon: Icons.water_drop),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Products", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("See all →", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                ProductCard(name: "Fresh Bananas", price: "1.20", weight: "500g", img: 'https://images.unsplash.com/photo-1571771894821-ad9902d73647?w=200'),
                ProductCard(name: "Whole Milk", price: "2.50", weight: "1L", img: 'https://images.unsplash.com/photo-1563636619-e9107da4a199?w=200'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- 3. Product Detail Screen ---
class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String price;
  final String img;

  const ProductDetailScreen({
    super.key,
    this.name = "Apex Ergonomic Lounger",
    this.price = "449.00",
    this.img = 'https://images.unsplash.com/photo-1581539250439-c96689b516dd?w=500',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Colors.black)),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Image.network(
            img,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 350,
              width: double.infinity,
              color: Colors.grey[200],
              child: const Icon(Icons.broken_image, size: 100, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("\$$price", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(height: 15),
                  const Text("Product Details", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Text("Experience ultimate comfort with premium breathable mesh and high-density memory foam...", style: TextStyle(color: Colors.grey)),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFF00),
                      minimumSize: const Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                    },
                    child: const Text("ADD TO CART", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// --- 4. Cart Screen ---
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart", style: TextStyle(color: Colors.black)), backgroundColor: Colors.white, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                CartItem(title: "Classic Minimal Watch", price: "120.00", sub: "Silver/White"),
                CartItem(title: "Studio Headphones", price: "299.00", sub: "Midnight Black"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Column(
              children: [
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Subtotal"), Text("\$504.50")]),
                const SizedBox(height: 10),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Total Amount", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text("\$516.50", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))]),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFFF00), minimumSize: const Size(double.infinity, 55), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderSuccessScreen())),
                  child: const Text("Place Order >", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// --- 5. Order Success & Tracking ---
class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 100, color: Color(0xFFFFFF00)),
            const SizedBox(height: 20),
            const Text("Order Placed Successfully!", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Order ID: #JK-99283", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFFF00), padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainNavigationWrapper(initialIndex: 3)),
                  (route) => false,
                );
              },
              child: const Text("Track Order", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Status"), backgroundColor: Colors.white, elevation: 0),
      body: Column(
        children: [
          Container(height: 200, color: Colors.grey[300], child: const Center(child: Text("Map View Placeholder"))),
          const ListTile(leading: Icon(Icons.check_circle, color: Colors.yellow), title: Text("Order Placed"), subtitle: Text("12:30 PM")),
          const ListTile(leading: Icon(Icons.check_circle, color: Colors.yellow), title: Text("Order Packed"), subtitle: Text("Preparing your food")),
          const ListTile(leading: Icon(Icons.radio_button_checked, color: Colors.yellow), title: Text("Out for Delivery"), subtitle: Text("Carlos is on the way")),
        ],
      ),
    );
  }
}

// --- 6. Categories Screen ---
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Vegetables', 'icon': Icons.eco, 'color': Color(0xFFE8F5E9)},
    {'name': 'Fruits', 'icon': Icons.apple, 'color': Color(0xFFFFEBEE)},
    {'name': 'Dairy', 'icon': Icons.water_drop, 'color': Color(0xFFE3F2FD)},
    {'name': 'Bakery', 'icon': Icons.breakfast_dining, 'color': Color(0xFFFFF3E0)},
    {'name': 'Meat', 'icon': Icons.set_meal, 'color': Color(0xFFFFEBEE)},
    {'name': 'Snacks', 'icon': Icons.cookie, 'color': Color(0xFFFFF8E1)},
    {'name': 'Beverages', 'icon': Icons.local_drink, 'color': Color(0xFFE0F7FA)},
    {'name': 'Personal Care', 'icon': Icons.spa, 'color': Color(0xFFF3E5F5)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: categories[index]['color'],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]['icon'], size: 50, color: Colors.black54),
                const SizedBox(height: 10),
                Text(
                  categories[index]['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// --- 7. Profile Screen ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200'),
            ),
            const SizedBox(height: 15),
            const Text("John Doe", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("john.doe@example.com", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            const Divider(),
            ListTile(leading: const Icon(Icons.shopping_bag_outlined), title: const Text("My Orders"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            ListTile(leading: const Icon(Icons.location_on_outlined), title: const Text("Address Book"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            ListTile(leading: const Icon(Icons.payment_outlined), title: const Text("Payment Methods"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            ListTile(leading: const Icon(Icons.settings_outlined), title: const Text("Settings"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            ListTile(leading: const Icon(Icons.help_outline), title: const Text("Help & Support"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Helpers ---
class CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  const CategoryItem({super.key, required this.label, required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundColor: isSelected ? const Color(0xFFFFFF00) : Colors.white, child: Icon(icon, color: Colors.black)),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name, price, weight, img;
  const ProductCard({super.key, required this.name, required this.price, required this.weight, required this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(name: name, price: price, img: img))),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(weight, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold)), const Icon(Icons.add_circle, color: Color(0xFFFFFF00))]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String title, price, sub;
  const CartItem({super.key, required this.title, required this.price, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        leading: Container(width: 50, height: 50, color: Colors.grey[200]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(sub),
        trailing: Text("\$$price", style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}