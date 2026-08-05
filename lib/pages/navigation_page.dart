import 'package:flutter/material.dart';

import 'favorites_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {

  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() =>
      _NavigationPageState();
}

class _NavigationPageState
    extends State<NavigationPage> {

  int currentIndex = 0;

  final List<Widget> pages = [

    const HomePage(),
    const FavoritesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar:
          BottomNavigationBar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {
            currentIndex = index;
          });
        },

        selectedItemColor:
            const Color(0xFFF9D923),

        unselectedItemColor:
            Colors.grey,

        backgroundColor: Colors.white,

        elevation: 10,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

