import 'package:flutter/material.dart';

import '../home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 30,
                child: Image.asset("assets/images/icons/home (1).png")),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 30,
                child: Image.asset("assets/images/icons/calculator (1).png")),
            label: 'PEL Calculator',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 30,
                child: Image.asset("assets/images/icons/user (1).png")),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                height: 30, child: Image.asset("assets/images/icons/gear.png")),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF5763DF),
        unselectedItemColor: const Color(0xFF5763DF).withOpacity(0.5),
        onTap: _onItemTapped,
      ),
    );
  }
}
