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
            icon: Icon(Icons.assignment),
            label: 'Attendance',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.add_card),
            label: 'Spot',

            ),
           BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active_rounded),
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
