import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/models/search_stock_response.dart';
import 'package:stock_app/provider/search_stock_notifier.dart';
import 'package:stock_app/screens/login_screen.dart';
import 'package:stock_app/screens/stock_detail.dart';
import 'package:stock_app/services/auth_service.dart';

final authProviders = StateProvider<bool>((ref) => true);

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final TextEditingController _searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authProviders);

    if (!isAuthenticated) {
      Future.microtask(() {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
        );
      });
    }

    final stockState = ref.watch(searchStockProvider);

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          _buildHeader(context, ref),
          Expanded(
            child: stockState.when(
              data: (stocks) {
                if (stocks.isEmpty) {
                  return const Center(
                    child: Text(
                      "No stock found, try another search!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: stocks.length,
                  itemBuilder: (context, index) {
                    final stock = stocks[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: ListTile(
                        title: Text(stock.name!),
                        subtitle: Text("Price: \$${stock.industry}"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StockDetailScreen(stockId: "${stock.id}"),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(
                child: Text(
                  "Please search some stock",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              error: (e, _) => Center(
                child: Text(
                  "Error: ${e.toString()}",
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Menu Icon (for opening Drawer)
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              // Title
              const Text(
                "Stock Search",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              Icon(
                Icons.notification_add_rounded,
                color: Colors.white,
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    labelText: "Search Stock",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.blueAccent,
                ),
                child: IconButton(
                  onPressed: () {
                    ref
                        .read(searchStockProvider.notifier)
                        .fetchData(query: _searchController.text);
                  },
                  icon: const Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                accountName: Text(""),
                accountEmail: Text(""),
                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://via.placeholder.com/150"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {},
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title:
                    const Text("Logout", style: TextStyle(color: Colors.red)),
                onTap: () {
                  AuthService().logout();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
