import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/const/color.dart';
import 'package:practice/pages/account/account.dart';
import 'package:practice/pages/cart/cart.dart';
import 'package:practice/pages/favorites/favorites.dart';
import 'package:practice/pages/home.dart';
import 'package:practice/pages/auth/login.dart';
import 'package:practice/pages/search/search.dart';
import 'package:practice/providers/global_state.dart';
import 'package:practice/widgets/cart_icon_with_badge.dart';

class BottomNev extends ConsumerStatefulWidget {
  const BottomNev({super.key});

  @override
  ConsumerState<BottomNev> createState() => _ConsumerBottomNevState();
}

class _ConsumerBottomNevState extends ConsumerState<BottomNev> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Home(),
    Search(),
    Cart(),
    Favorites(),
    Account(),
  ];
  @override
  Widget build(BuildContext context) {
  final isLoggedIn = ref.watch(loggedInProvider);
    if (!isLoggedIn) {
        return Login();
    }
    return Scaffold(
     
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:primaryColor,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        unselectedItemColor: secondaryColor,
        selectedItemColor: buttonColor,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: buttonColor),
            label: 'Home',
            activeIcon: (Icon(Icons.home, color: buttonColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            activeIcon: (Icon(Icons.search, color:buttonColor)),
          ),
          BottomNavigationBarItem(
            icon: Carticonwithbadge(active: false),
            label: 'Cart',
            activeIcon: Carticonwithbadge(active: true),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
            activeIcon: (Icon(Icons.favorite, color: buttonColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
            activeIcon: (Icon(Icons.account_circle, color:buttonColor)),
          ),
        ],
      ),
    );
  }
}
