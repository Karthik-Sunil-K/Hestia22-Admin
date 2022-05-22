import 'package:flutter/material.dart';
import 'package:hestiaadmin/screens/attendance/attendance_detailed.dart';

class Attendance extends StatelessWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20,
            ),
            child: Column(
              children: const [
                EventCard(),
                SizedBox(
                  height: 10,
                ),
                EventCard(),
                SizedBox(
                  height: 10,
                ),
                EventCard(),
              ],
            ),
          )),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => AttendanceDetailed())));
        print('Tapped');
      },
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
          color: Colors.grey.shade800,
          elevation: 5,
          child: const Padding(
            padding: EdgeInsets.only(
              top: 80,
              left: 20,
            ),
            child: Text(
              'Event 1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
