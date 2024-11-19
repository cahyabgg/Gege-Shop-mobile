import 'package:flutter/material.dart';
import 'package:gege_shop_mobile/screens/list_product.dart';
import 'package:gege_shop_mobile/screens/login.dart';
import 'package:gege_shop_mobile/widgets/left_drawer.dart';
import 'package:gege_shop_mobile/screens/product_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> tabNames = ["Lihat Product", "Add Product", "Logout"];
  bool _isExpanded = false;

  // Method to build the first tab content
  Widget _buildFirstTabContent() {
    return const ProductPage();
  }

  // Method to build the second tab content
  Widget _buildSecondTabContent() {
    return const ProductFormPage();
  }

  // Method to build the logout tab content
  Widget _buildThirdTabContent(BuildContext context) {
  return Center(
    child: ElevatedButton.icon(
      icon: const Icon(Icons.logout, color: Colors.white),
      label: const Text(
        "Logout",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () async {
        final request = context.read<CookieRequest>();

        try {
          // Attempt to logout
          final response = await request.logout("http://127.0.0.1:8000/auth/logout/");

          // Validate response
          if (response == null || !response.containsKey("status")) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error: Server tidak merespons dengan benar")),
            );
            return;
          }

          // Handle successful logout
          if (response['status'] == true) {
            String message = response['message'] ?? "Logout berhasil";
            String uname = response['username'] ?? "Pengguna";

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("$message Sampai jumpa, $uname!")),
            );

            if (context.mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          } else {
            // Handle logout failure
            String error = response['message'] ?? "Logout gagal";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error)),
            );
          }
        } catch (e) {
          // Catch unexpected errors
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${e.toString()}")),
          );
        }
      },
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gege Shop',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _buildFirstTabContent(),
                  _buildSecondTabContent(),
                  _buildThirdTabContent(context), // Logout tab content
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.primary,
          child: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.add_shopping_cart, color: Colors.greenAccent),
                text: 'Lihat Product',
              ),
              Tab(
                icon: Icon(Icons.add, color: Colors.yellow),
                text: 'Add Product',
              ),
              Tab(
                icon: Icon(Icons.logout, color: Colors.red),
                text: 'Logout',
              ),
            ],
          ),
        ),
        drawer: const LeftDrawer(),
      ),
    );
  }
}
