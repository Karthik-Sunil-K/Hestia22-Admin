// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

List<Event> eventFromJson(List str) =>
    List<Event>.from(str.map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Event {
  Event({
    required this.id,
    required this.venue,
    required this.dept,
    required this.coordinator1,
    required this.coordinator2,
    required this.title,
    required this.shortTitle,
    required this.shortDesc,
    required this.slug,
    required this.desc,
    required this.eventCategory,
    required this.prize,
    required this.isVisible,
    required this.minMembersInTeam,
    required this.maxMembersInTeam,
    required this.maxTeams,
    required this.isTeam,
    required this.fees,
    required this.isFeesTeam,
    required this.image,
    required this.isRegOpen,
    required this.isFileUpload,
    required this.guidelineFile,
    required this.regStart,
    required this.regEnd,
    required this.eventStart,
    required this.eventEnd,
    required this.fileSubmissionEnd,
  });

  final int id;
  final Venue venue;
  final Dept dept;
  final Coordinator1 coordinator1;
  final dynamic coordinator2;
  final String title;
  final String shortTitle;
  final String shortDesc;
  final String slug;
  final String desc;
  final String eventCategory;
  final double prize;
  final bool isVisible;
  final int minMembersInTeam;
  final int maxMembersInTeam;
  final int maxTeams;
  final bool isTeam;
  final double fees;
  final bool isFeesTeam;
  final dynamic image;
  final bool isRegOpen;
  final bool isFileUpload;
  final dynamic guidelineFile;
  final DateTime regStart;
  final DateTime regEnd;
  final dynamic eventStart;
  final dynamic eventEnd;
  final dynamic fileSubmissionEnd;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        venue: Venue.fromJson(json["venue"]),
        dept: Dept.fromJson(json["dept"]),
        coordinator1: Coordinator1.fromJson(json["coordinator_1"]),
        coordinator2: json["coordinator_2"],
        title: json["title"],
        shortTitle: json["short_title"],
        shortDesc: json["short_desc"],
        slug: json["slug"],
        desc: json["desc"],
        eventCategory: json["event_category"],
        prize: json["prize"],
        isVisible: json["is_visible"],
        minMembersInTeam: json["min_members_in_team"],
        maxMembersInTeam: json["max_members_in_team"],
        maxTeams: json["max_teams"],
        isTeam: json["is_team"],
        fees: json["fees"],
        isFeesTeam: json["is_fees_team"],
        image: json["image"],
        isRegOpen: json["is_reg_open"],
        isFileUpload: json["is_file_upload"],
        guidelineFile: json["guideline_file"],
        regStart: DateTime.parse(json["reg_start"]),
        regEnd: DateTime.parse(json["reg_end"]),
        eventStart: json["event_start"],
        eventEnd: json["event_end"],
        fileSubmissionEnd: json["file_submission_end"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "venue": venue.toJson(),
        "dept": dept.toJson(),
        "coordinator_1": coordinator1.toJson(),
        "coordinator_2": coordinator2,
        "title": title,
        "short_title": shortTitle,
        "short_desc": shortDesc,
        "slug": slug,
        "desc": desc,
        "event_category": eventCategory,
        "prize": prize,
        "is_visible": isVisible,
        "min_members_in_team": minMembersInTeam,
        "max_members_in_team": maxMembersInTeam,
        "max_teams": maxTeams,
        "is_team": isTeam,
        "fees": fees,
        "is_fees_team": isFeesTeam,
        "image": image,
        "is_reg_open": isRegOpen,
        "is_file_upload": isFileUpload,
        "guideline_file": guidelineFile,
        "reg_start": regStart.toIso8601String(),
        "reg_end": regEnd.toIso8601String(),
        "event_start": eventStart,
        "event_end": eventEnd,
        "file_submission_end": fileSubmissionEnd,
      };
}

class Coordinator1 {
  Coordinator1({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  final String name;
  final String email;
  final dynamic phoneNumber;

  factory Coordinator1.fromJson(Map<String, dynamic> json) => Coordinator1(
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

class Dept {
  Dept({
    required this.id,
    required this.title,
    required this.slug,
  });

  final int id;
  final String title;
  final String slug;

  factory Dept.fromJson(Map<String, dynamic> json) => Dept(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
      };
}

class Venue {
  Venue({
    required this.id,
    required this.title,
    required this.slug,
    required this.picture,
    required this.desc,
    required this.shortDesc,
  });

  final int id;
  final String title;
  final String slug;
  final String picture;
  final String desc;
  final String shortDesc;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        picture: json["picture"],
        desc: json["desc"],
        shortDesc: json["short_desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "picture": picture,
        "desc": desc,
        "short_desc": shortDesc,
      };
}
