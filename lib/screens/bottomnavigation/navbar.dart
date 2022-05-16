import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int newIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text('HAii'),),
      bottomNavigationBar: BottomNavigationBar(
        
        currentIndex: newIndex,
        onTap: (index){
          setState(() {
            newIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Attendance',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Spot',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: 'Notification',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',

            ),
        ],)
    );
  }
}
