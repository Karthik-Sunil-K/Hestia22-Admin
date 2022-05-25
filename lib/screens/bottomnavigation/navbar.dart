import 'package:flutter/material.dart';
import 'package:hestiaadmin/screens/attendance/attendance.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int newIndex=0;
  final screens =[Attendance(),Center(child: Text("haaai"),)];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[newIndex],
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
            label: 'Winner',

            ),
           
        ],)
    );
  }
}
