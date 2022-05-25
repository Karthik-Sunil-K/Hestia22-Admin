import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hestiaadmin/models/participant.dart';

class ParticipantDetails extends StatelessWidget {
  const ParticipantDetails({
    Key? key,
    required this.participant,
  }) : super(key: key);
  final Participant participant;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(participant.teamLeader.name),
        ],
      ),
    ));
  }
}
