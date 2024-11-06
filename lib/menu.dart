import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  // Konstruktor tanpa `const` karena variabel `tabNames` tidak bisa menjadi konstanta
  MyHomePage({super.key});

  // Nama-nama tab yang akan ditampilkan pada SnackBar saat tab dipilih
  final List<String> tabNames = ["Lihat Product", "Add Product", "Logout"];

  final String npm = '2306275380'; // Npm
  final String name = 'Cahya Bagus Gautama Gozales'; //Nama
  final String className = 'PBP C'; // Kelas

  // Metode untuk membangun bagian InfoCard yang ditampilkan di atas
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

  // Metode untuk membangun konten utama di setiap tab
  Widget _buildTabContent(IconData icon) {
    return Center(
      child: Icon(icon, size: 100, color: Colors.black),
    );
  }

  // Metode untuk menangani aksi ketika TabBar di-tap dan menampilkan SnackBar
  void _onTabTapped(BuildContext context, int index) {
    final selectedTab = tabNames[index];
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("Kamu telah menekan tab $selectedTab!")));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab yang digunakan
      child: Scaffold(
        // AppBar dengan judul statis
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
        
        // Body yang terdiri dari bagian InfoCard yang tetap dan TabBarView yang dinamis
        body: Column(
          children: [
            _buildInfoSection(), // Bagian InfoCard yang tetap di atas
            Expanded(
              child: TabBarView(
                children: [
                  _buildTabContent(Icons.add_shopping_cart), // Tab Lihat Product
                  _buildTabContent(Icons.add),               // Tab Add Product
                  _buildTabContent(Icons.logout),            // Tab Logout
                ],
              ),
            ),
          ],
        ),
        
        // Bottom navigation bar yang berisi TabBar
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.primary,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            onTap: (index) => _onTabTapped(context, index), // Memanggil metode SnackBar saat tab di-tap
            tabs: const [
              Tab(icon: Icon(Icons.add_shopping_cart,color: Colors.greenAccent,), text: 'Lihat Product'),
              Tab(icon: Icon(Icons.add, color: Colors.yellow,), text: 'Add Product'),
              Tab(icon: Icon(Icons.logout, color: Colors.red,), text: 'Logout'),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget InfoCard untuk menampilkan title dan content
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
