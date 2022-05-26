import 'package:flutter/material.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:hestiaadmin/screens/attendance/api_provider.dart';
import 'package:provider/provider.dart';

class AttendanceDetailed extends StatelessWidget {
  AttendanceDetailed({Key? key, required this.event}) : super(key: key);
  final Event event;
  bool isInit = true;

  bool value = true;

  void markAttendance() => value = !value;

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      context.read<ApiProvider>().fetchParticipants(event.slug);
      isInit = false;
    }

    List participants = context.read<ApiProvider>().participants;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(event.title),
        ),
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: context.watch<ApiProvider>().participantsLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            context.watch<ApiProvider>().participants.length,
                        itemBuilder: ((context, index) => AttendanceTile(
                              alternate: index % 2 == 0,
                              participant: participants[index],
                            )),
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
                onPressed: () => Navigator.of(context).pop(),
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
  final Participant participant;

  const AttendanceTile({
    Key? key,
    required this.participant,
    required this.alternate,
  }) : super(key: key);

  @override
  State<AttendanceTile> createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<AttendanceTile> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.participant.attendance;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: widget.alternate ? Color.fromARGB(255, 50, 50, 50) : null,
      textColor: Colors.white,
      iconColor: Colors.white,
      title: Text(
        widget.participant.teamLeader.name,
      ),
      // subtitle: Text(
      //   widget.participant.id,
      // ),
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
            context.read<ApiProvider>().markAttendance(widget.participant, _!);
            value = _;
          });
        },
      ),
    );
  }
}
