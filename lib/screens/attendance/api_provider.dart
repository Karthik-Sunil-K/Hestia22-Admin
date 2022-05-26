import 'package:flutter/cupertino.dart';
import 'package:hestiaadmin/main.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:hestiaadmin/models/team.dart';

class ApiProvider with ChangeNotifier {
  bool eventsLoading = true;
  bool participantsLoading = true;
  bool teamLoading = true;
  bool winnersLoading = true;

  List<Event> events = [];
  List<Participant> participants = [];
  Team? team;

  Map winners = {};

  void fetchEvents() async {
    events = await auth.getAllEvents();
    eventsLoading = false;
    notifyListeners();
  }

  void fetchParticipants(String eventSlug) async {
    participantsLoading = true;
    notifyListeners();

    participants = await auth.getParticipants(eventSlug);
    participantsLoading = false;
    notifyListeners();
  }

  void fetchTeamDetails(String teamSlug) async {
    teamLoading = true;
    notifyListeners();

    team = await auth.getTeamDetails(teamSlug);
    teamLoading = false;
    notifyListeners();
  }

  void fetchWinners(String eventSlug) async {
    if (winnersLoading == false) {
      winnersLoading = true;
      notifyListeners();
    }

    winners = await auth.getWinners(eventSlug);
    winnersLoading = false;
    notifyListeners();
  }

  void markAttendance(Participant participant, bool attendance) async {
    await auth.putAttendance(participant.slug, attendance);
  }
}
