import 'package:flutter/cupertino.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:hestiaadmin/services/django/django.dart';

class ApiProvider with ChangeNotifier {
  bool eventsLoading = true;
  bool participantsLoading = true;

  List<Event> events = [];
  List<Participant> participants = [];

  void fetchEvents() async {
    events = await getAllEvents();
    print(events[0].slug);
    eventsLoading = false;
    notifyListeners();
  }

  void fetchParticipants(String eventSlug) async {
    participantsLoading = true;
    notifyListeners();

    participants = await getParticipants(eventSlug);
    print(participants);
    participantsLoading = false;
    notifyListeners();
  }

  void markAttendance(Participant participant, bool attendance) async {
    //TODO: Api CALL
    await putAttendance(participant.slug, attendance);
    print(participant.slug + attendance.toString());
  }
}
