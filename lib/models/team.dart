// To parse this JSON data, do
//
//     final team = teamFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Team teamFromJson(String str) => Team.fromJson(json.decode(str));

String teamToJson(Team data) => json.encode(data.toJson());

class Team {
  Team({
    required this.id,
    required this.teamLeader,
    required this.members,
    required this.title,
    required this.userFile,
    required this.hasPaid,
    required this.isComplete,
    required this.isTeamComplete,
    required this.isFileComplete,
    required this.teamCount,
    required this.reqCount,
    required this.slug,
    required this.referral,
    required this.isSpot,
    required this.attendance,
    required this.event,
  });

  final String id;
  final TeamLeader teamLeader;
  final Members members;
  final dynamic title;
  final dynamic userFile;
  final bool hasPaid;
  final bool isComplete;
  final bool isTeamComplete;
  final bool isFileComplete;
  final int teamCount;
  final int reqCount;
  final String slug;
  final String referral;
  final bool isSpot;
  final bool attendance;
  final int event;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        teamLeader: TeamLeader.fromJson(json["team_leader"]),
        members: Members.fromJson(json["members"]),
        title: json["title"],
        userFile: json["user_file"],
        hasPaid: json["has_paid"],
        isComplete: json["is_complete"],
        isTeamComplete: json["is_team_complete"],
        isFileComplete: json["is_file_complete"],
        teamCount: json["team_count"],
        reqCount: json["req_count"],
        slug: json["slug"],
        referral: json["referral"] ?? '',
        isSpot: json["is_spot"] ?? '',
        attendance: json["attendance"],
        event: json["event"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_leader": teamLeader.toJson(),
        "members": members.toJson(),
        "title": title,
        "user_file": userFile,
        "has_paid": hasPaid,
        "is_complete": isComplete,
        "is_team_complete": isTeamComplete,
        "is_file_complete": isFileComplete,
        "team_count": teamCount,
        "req_count": reqCount,
        "slug": slug,
        "referral": referral,
        "is_spot": isSpot,
        "attendance": attendance,
        "event": event,
      };
}

class Members {
  Members({
    required this.accepted,
    required this.pending,
  });

  final List<Accepted> accepted;
  final List<Accepted> pending;

  factory Members.fromJson(Map<String, dynamic> json) => Members(
        accepted: List<Accepted>.from(
            json["accepted"].map((x) => Accepted.fromJson(x))),
        pending: List<Accepted>.from(
            json["pending"].map((x) => Accepted.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "accepted": List<dynamic>.from(accepted.map((x) => x.toJson())),
        "pending": List<dynamic>.from(pending.map((x) => x)),
      };
}

class Accepted {
  Accepted({
    required this.user,
  });

  final TeamLeader user;

  factory Accepted.fromJson(Map<String, dynamic> json) => Accepted(
        user: TeamLeader.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
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
        name: json["name"] ?? '',
        email: json["email"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
      };
}
