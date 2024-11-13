import 'package:flutter/material.dart';
import 'package:gege_shop_mobile/widgets/left_drawer.dart';
import 'package:gege_shop_mobile/screens/product_form.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(); // Implement createState method
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> tabNames = ["Lihat Product", "Add Product", "Logout"];
  final String npm = '2306275380';
  final String name = 'Cahya Bagus Gautama Gozales';
  final String className = 'PBP C';

  bool _isExpanded = false;

  // Method to build the InfoCard section displayed at the top
  Widget _buildInfoSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InfoCard(title: 'NPM', content: npm),
          InfoCard(title: 'Name', content: name),
          InfoCard(title: 'Class', content: className),
        ],
      ),
    );
  }

  // Method to build the main content in each tab
  Widget _buildTabContent(IconData icon) {
    return Center(
      child: Icon(icon, size: 100, color: Colors.black),
    );
  }

  // Method to build the first tab content with animation
  Widget _buildFirstTabContent() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: _isExpanded ? 200.0 : 100.0,
        height: _isExpanded ? 200.0 : 100.0,
        color: Colors.blue,
        curve: Curves.elasticInOut,
      ),
    );
  }

  Widget _buildSecondTabContent(){
    return const ProductFormPage();
  }

  // Method to handle actions when a TabBar tab is tapped
  void _onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      setState(() {
        _isExpanded = !_isExpanded; // Toggle animation for the first tab
      });
    }

    final selectedTab = tabNames[index];
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
          SnackBar(content: Text("Kamu telah menekan tab $selectedTab!")));
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
                  _buildTabContent(Icons.logout),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            onTap: (index) => _onTabTapped(context, index),
            tabs: const [
              Tab(
                  icon:
                      Icon(Icons.add_shopping_cart, color: Colors.greenAccent),
                  text: 'Lihat Product'),
              Tab(
                  icon: Icon(Icons.add, color: Colors.yellow),
                  text: 'Add Product'),
              Tab(icon: Icon(Icons.logout, color: Colors.red), text: 'Logout'),
            ],
          ),
        ),
      drawer: const LeftDrawer(),
      ),
    );
  }
}

// Widget InfoCard for displaying title and content
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
