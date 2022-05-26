import 'package:flutter/material.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:hestiaadmin/screens/attendance/api_provider.dart';
import 'package:hestiaadmin/screens/attendance/participant_details.dart';
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

    List participantsList = context.read<ApiProvider>().participants;
    participantsList.sort((a, b) => a.teamLeader.name
        .toString()
        .toLowerCase()
        .compareTo(b.teamLeader.name.toString().toLowerCase()));

    for (int i = 0; i < participantsList.length; i++) {}
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(event.title, overflow: TextOverflow.ellipsis),
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
                          child: CircularProgressIndicator(
                            color: Color.fromRGBO(68, 223, 180, 1),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            context.watch<ApiProvider>().participants.length,
                        itemBuilder: ((context, index) => AttendanceTile(
                              alternate: index % 2 == 0,
                              participant: participantsList[index],
                            )),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.grey.shade600,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Text(
                    "Submit",
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Helvetica'),
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
      onTap: (() => Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) =>
                  ParticipantDetails(participant: widget.participant)),
            ),
          )),
      tileColor:
          widget.alternate ? const Color.fromARGB(255, 50, 50, 50) : null,
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
