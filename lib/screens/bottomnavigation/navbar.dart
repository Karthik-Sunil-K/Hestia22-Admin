import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text('HAii'),),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Home',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

            ),
        ],)
    );
  }
}
