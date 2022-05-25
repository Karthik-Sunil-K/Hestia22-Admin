// To parse this JSON data, do
//
//     final participant = participantFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Participant> participantFromJson(String str) => List<Participant>.from(
    json.decode(str).map((x) => Participant.fromJson(x)));

String participantToJson(List<Participant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Participant {
  Participant({
    required this.id,
    required this.teamLeader,
    required this.attendance,
    required this.isSpot,
  });

  final String id;
  final TeamLeader teamLeader;
  final bool attendance;
  final bool isSpot;

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json["id"],
        teamLeader: TeamLeader.fromJson(json["team_leader"]),
        attendance: json["attendance"],
        isSpot: json["is_spot"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_leader": teamLeader.toJson(),
        "attendance": attendance,
        "is_spot": isSpot,
      };
}

class TeamLeader {
  TeamLeader({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  final String name;
  final String email;
  final String phoneNumber;

  factory TeamLeader.fromJson(Map<String, dynamic> json) => TeamLeader(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
      };
}
