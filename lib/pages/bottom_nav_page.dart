import 'package:e_commerce_app_with_api/pages/category_page.dart';
import 'package:e_commerce_app_with_api/pages/home_page.dart';
import 'package:e_commerce_app_with_api/pages/order_page.dart';
import 'package:e_commerce_app_with_api/pages/product_page.dart';
import 'package:e_commerce_app_with_api/pages/profile_page.dart';
import 'package:flutter/material.dart';


class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  List pages = [
    HomePage(),
    ProductPage(),
    CategoryPage(),
    OrderPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        // elevation: 50.0,
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],

      ),
    );
  }
}
