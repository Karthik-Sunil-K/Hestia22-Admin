import 'dart:convert';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:http/http.dart' as http;

String hostUrl = "https://backend.hestiatkmce.live";

Future<List<Event>> getAllEvents() async {
  final String token = 'fdee6ed3ce930d356ea67807b4d1de44dfcae873';

  http.Response response = await http.get(
      Uri.parse(hostUrl + "/api/v1/event/coordinator/"),
      headers: {'Authorization': "token " + token});
  final result = eventFromJson(json.decode(response.body)['results']);
  return result;
}

Future<List<Participant>> getParticipants(String eventSlug) async {
  final String token = 'fdee6ed3ce930d356ea67807b4d1de44dfcae873';
  http.Response response = await http.get(
      Uri.parse(hostUrl + "/api/v1/event/attendance/$eventSlug"),
      headers: {'Authorization': "token " + token});
  print(response.body);
  final result = participantFromJson(response.body);
  return result;
}

Future<List<dynamic>> postAttendance(String teamSlug) async {
  http.Response response = await http
      .post(Uri.parse(hostUrl + "/api/v1/event/attendance/$teamSlug/update"));
  return json.decode(response.body)['results'];
}

// Future<List<dynamic>> getAllEvents() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getWorkshops() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=W"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getTechnicals() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=T"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getLectures() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=L"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getGenerals() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=G"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getProshows() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=P"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getCulturals() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/?event_category=C"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getTrendingEvents() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/trending"));
//   return json.decode(response.body)['results'];
// }

// Future<List<dynamic>> getSpots() async {
//   http.Response response =
//       await http.get(Uri.parse(hostUrl + "/api/v1/event/location/all"));

//   List<dynamic> list = json.decode(response.body)['results'];

//   for (dynamic result in list) {
//     http.Response response1 = await http.get(
//         Uri.parse(hostUrl + "/api/v1/event/?venue__title=" + result['title']));

//     result['events'] = json.decode(response1.body)['results'];
//   }

//   return list;
// }

// Future<List<dynamic>> getSchedule(String start, String end) async {
//   http.Response response = await http.get(Uri.parse(hostUrl +
//       "/api/v1/event/?event_start=${start}T23:59:59&event_end=${end}T23:59:59"));

//   return jsonDecode(response.body)['results'];
// }
