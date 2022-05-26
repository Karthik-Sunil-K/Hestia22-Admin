import 'package:flutter/cupertino.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:hestiaadmin/services/django/django.dart';

import '../../models/team.dart';

class ApiProvider with ChangeNotifier {
  bool eventsLoading = true;
  bool participantsLoading = true;
  bool teamLoading = true;

  List<Event> events = [];
  List<Participant> participants = [];
  Team? team;

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

  void fetchTeamDetails(String teamSlug) async {
    teamLoading = true;
    notifyListeners();

    team = await getTeamDetails(teamSlug);
    print(participants);
    teamLoading = false;
    notifyListeners();
  }

  void markAttendance(Participant participant, bool attendance) async {
    print('Participant slug: ' + participant.slug);
    await putAttendance(participant.slug, attendance);
  }
}
