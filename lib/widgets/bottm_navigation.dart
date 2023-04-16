import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavBar extends StatefulWidget {
  int selectedItem = 0;
  Function(int) onTap;
  BottomNavBar({super.key, required this.selectedItem, required this.onTap});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedItem,
      onTap: widget.onTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Color.fromARGB(255, 0, 88, 79),
      items: const [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Favorite', icon: Icon(Icons.favorite)),
        BottomNavigationBarItem(
            label: 'Cart', icon: Icon(Icons.shopping_basket)),
        BottomNavigationBarItem(label: 'Account', icon: Icon(Icons.person)),
      ],
    );
  }
}
