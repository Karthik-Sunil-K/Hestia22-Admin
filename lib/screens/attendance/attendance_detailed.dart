import 'package:flutter/material.dart';

class AttendanceDetailed extends StatelessWidget {
  AttendanceDetailed({Key? key}) : super(key: key);

  bool value = true;

  void markAttendance() => value = !value;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: const Text('Event Name'),
        ),
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                    AttendanceTile(alternate: true),
                    AttendanceTile(alternate: false),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
              ),
              padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(68, 223, 180, 1),
                ),
                onPressed: () {},
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceTile extends StatefulWidget {
  final bool alternate;

  const AttendanceTile({
    Key? key,
    required this.alternate,
  }) : super(key: key);

  @override
  State<AttendanceTile> createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<AttendanceTile> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.alternate ? Color.fromARGB(255, 50, 50, 50) : null,
      textColor: Colors.white,
      iconColor: Colors.white,
      title: const Text(
        'Name',
      ),
      trailing: Checkbox(
        activeColor: const Color.fromRGBO(68, 223, 180, 1),
        fillColor: MaterialStateColor.resolveWith(
          (states) => const Color.fromRGBO(68, 223, 180, 1),
        ),
        hoverColor: Colors.white,
        checkColor: Colors.white,
        value: value,
        onChanged: (_) {
          setState(() {
            value = _!;
          });
        },
      ),
    );
  }
}
