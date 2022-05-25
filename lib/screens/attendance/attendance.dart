import 'package:flutter/material.dart';
import 'package:hestiaadmin/screens/attendance/api_provider.dart';
import 'package:hestiaadmin/screens/attendance/attendance_detailed.dart';
import 'package:provider/provider.dart';

import '../../models/event.dart';

class Attendance extends StatelessWidget {
  bool isInit = true;
  Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (isInit) {
        isInit = false;
        context.read<ApiProvider>().fetchEvents();
      }
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 20,
          ),
          child: context.watch<ApiProvider>().eventsLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: context.watch<ApiProvider>().events.length,
                  itemBuilder: (BuildContext context, int index) => EventCard(
                    event: context.read<ApiProvider>().events[index],
                  ),
                ),
        ),
      ));
    });
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => AttendanceDetailed(
                  event: event,
                ))));
        print('Tapped');
      },
      child: SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
          color: Colors.grey.shade800,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 80,
              left: 20,
            ),
            child: Text(
              event.title,
              style: const TextStyle(
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
