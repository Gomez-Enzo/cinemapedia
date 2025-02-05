import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomButtomNavigation extends StatelessWidget {
  final int currentIndex;
  const CustomButtomNavigation({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      onTap: (index) => onItemTapped(context, index),
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(Icons.home_max),
        ),
        BottomNavigationBarItem(
          label: 'Categorias',
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: 'Favoritos',
          icon: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }
}
