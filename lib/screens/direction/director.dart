import 'package:flutter/material.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/screens/attendance/attendance_detailed.dart';
import 'package:hestiaadmin/screens/winners/show_winners.dart';

import '../winners/add_winners.dart';

class Director extends StatefulWidget {
  final Event? eventDetails;

  const Director({Key? key, this.eventDetails}) : super(key: key);

  @override
  State<Director> createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AttendanceDetailed(event: widget.eventDetails!)));
                },
                child: const Text(
                  "Mark Attendance",
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddWinners(
                                slug: widget.eventDetails!.slug,
                              )));
                },
                child: const Text(
                  "Add Winners",
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowWinners(
                                event: widget.eventDetails!,
                              )));
                },
                child: const Text(
                  "Show Winners",
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
