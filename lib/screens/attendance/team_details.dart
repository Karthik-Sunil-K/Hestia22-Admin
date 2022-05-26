import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:hestiaadmin/screens/attendance/participant_details.dart';
import 'package:provider/provider.dart';

import 'api_provider.dart';

class TeamDetails extends StatelessWidget {
  TeamDetails({Key? key}) : super(key: key);
  bool isInit = true;

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      context.read<ApiProvider>().fetchParticipants('wordsmith');
      isInit = false;
    }

    List<Participant> participants = context.read<ApiProvider>().participants;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text('event.title'),
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
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: ((context) => ParticipantDetails(
                                      participant: participants[index])),
                                ),
                              ),
                              child: ListTile(
                                tileColor: index % 2 == 0
                                    ? Color.fromARGB(255, 50, 50, 50)
                                    : null,
                                title:
                                    Text(participants[index].teamLeader.name),
                                textColor: Colors.white,
                              ),
                            )),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
