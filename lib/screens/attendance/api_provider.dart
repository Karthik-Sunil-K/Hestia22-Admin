import 'package:flutter/cupertino.dart';
import 'package:hestiaadmin/main.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';

import '../../services/django/django.dart';

class ApiProvider with ChangeNotifier {
  bool eventsLoading = true;
  bool participantsLoading = true;

  List<Event> events = [];
  List<Participant> participants = [];

  void fetchEvents() async {
    events = await auth.getAllEvents();
    print(events[0].slug);
    eventsLoading = false;
    notifyListeners();
  }

  void fetchParticipants(String eventSlug) async {
    participantsLoading = true;
    notifyListeners();

    participants = await auth.getParticipants(eventSlug);
    print(participants);
    participantsLoading = false;
    notifyListeners();
  }

  void markAttendance(Participant participant, bool attendance) async {
    //TODO: Api CALL
    await auth.putAttendance(participant.slug, attendance);
    print(participant.slug + attendance.toString());
  }
}
