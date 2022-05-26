import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hestiaadmin/models/team.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/event.dart';
import '../../models/participant.dart';

class GoogleAuth extends ChangeNotifier {
  String? token;
  bool? isCompleted;
  GoogleSignIn googleSignIn = GoogleSignIn();
  String hostUrl = "https://backend.hestiatkmce.live";

  Future<void> initLogin() async {
    token = await const FlutterSecureStorage().read(key: 'token');
    token ??= "";
    isCompleted =
        await const FlutterSecureStorage().read(key: 'is_completed') == "true"
            ? true
            : false;
    notifyListeners();

    googleSignIn.signInSilently();
  }

  Future<bool> login() async {
    try {
      GoogleSignInAccount? result = await googleSignIn.signIn();

      GoogleSignInAuthentication googleKey = await result!.authentication;

      http.Response response = await http.post(
        Uri.parse("https://backend.hestiatkmce.live/users/google/"),
        body: {
          "access_token": googleKey.accessToken,
          "code": "1",
        },
      );

      token = jsonDecode(response.body)['key'];

      await const FlutterSecureStorage().write(key: 'token', value: token);

      http.Response response1 = await http.get(
        Uri.parse("$hostUrl/api/v1/users/me"),
        headers: {'Authorization': "token " + token!},
      );

      isCompleted = jsonDecode(response1.body)['is_completed'];

      await const FlutterSecureStorage()
          .write(key: 'is_completed', value: isCompleted.toString());

      notifyListeners();

      return true;
    } catch (e) {
      token = "";
      notifyListeners();
      return false;
    }
  }

  Future<void> logOut() async {
    await googleSignIn.signOut();
    await const FlutterSecureStorage().delete(key: 'token');
    token = "";
    notifyListeners();
  }

  Future<List<Event>> getAllEvents() async {
    http.Response response = await http.get(
        Uri.parse(hostUrl + "/api/v1/event/coordinator/"),
        headers: {'Authorization': "token " + token!});
    final result = eventFromJson(json.decode(response.body)['results']);
    return result;
  }

  Future<List<Participant>> getParticipants(String eventSlug) async {
    http.Response response = await http.get(
        Uri.parse(hostUrl + "/api/v1/event/attendance/$eventSlug"),
        headers: {'Authorization': "token " + token!});
    final result = participantFromJson(response.body);
    return result;
  }

  Future<void> putAttendance(String teamSlug, bool isPresent) async {
    final jsonBody = json.encode({"attendance": isPresent});

    http.Response response = await http.put(
        Uri.parse(hostUrl + "/api/v1/event/attendance/$teamSlug/update"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "token " + token!,
        },
        body: jsonBody);

    // return json.decode(response.body)['results'];
  }

  Future<Map> putWinners(
      String? email1, String? email2, String? email3, String? slug) async {
    late http.Response response;
    response = await http.patch(
        Uri.parse(hostUrl + "/api/v1/event/winner/$slug/update"),
        headers: {
          'Authorization': "token " + token!
        },
        body: {
          "email1": email1.toString(),
          "email2": email2 ?? "",
          "email3": email3 ?? ""
        });

    Map map = json.decode(response.body);
    map['status_code'] = response.statusCode;
    return map;
  }

  Future<Team> getTeamDetails(String teamSlug) async {
    http.Response response = await http.get(
        Uri.parse(hostUrl + "/api/v1/event/detail/$teamSlug"),
        headers: {'Authorization': "token " + token!});
    final result = teamFromJson(response.body);
    return result;
  }

  Future<dynamic> getWinners(String eventSlug) async {
    http.Response response = await http.get(
        Uri.parse(hostUrl + "/api/v1/event/winner/$eventSlug"),
        headers: {'Authorization': "token " + token!});
    final result = json.decode(response.body);
    return result;
  }
}
