import 'dart:convert';
import 'package:hestiaadmin/models/event.dart';
import 'package:hestiaadmin/models/participant.dart';
import 'package:http/http.dart' as http;

String hostUrl = "https://backend.hestiatkmce.live";

// Future<List<Event>> getAllEvents() async {
//   final String token = 'fdee6ed3ce930d356ea67807b4d1de44dfcae873';

//   http.Response response = await http.get(
//       Uri.parse(hostUrl + "/api/v1/event/coordinator/"),
//       headers: {'Authorization': "token " + token});
//   print(response.body);
//   final result = eventFromJson(json.decode(response.body)['results']);
//   return result;
// }

// Future<List<Participant>> getParticipants(String eventSlug) async {
//   final String token = 'fdee6ed3ce930d356ea67807b4d1de44dfcae873';
//   http.Response response = await http.get(
//       Uri.parse(hostUrl + "/api/v1/event/attendance/$eventSlug"),
//       headers: {'Authorization': "token " + token});
//   print(response.body);
//   final result = participantFromJson(response.body);
//   return result;
// }

// Future<void> putAttendance(String teamSlug, bool isPresent) async {
//   final String token = 'fdee6ed3ce930d356ea67807b4d1de44dfcae873';

//   final jsonBody = json.encode({"attendance": isPresent});
//   print(jsonBody);

//   http.Response response = await http.put(
//       Uri.parse(hostUrl + "/api/v1/event/attendance/$teamSlug/update"),
//       headers: {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'Authorization': "token " + token,
//       },
//       body: jsonBody);
//   print(teamSlug);
//   print(response.body);
//   // return json.decode(response.body)['results'];
// }

// Future<Map> putWinners(
//     String? email1, String? email2, String? email3, String? slug) async {
//   final String token = 'fdee6ed3ce930d356ea67807b4d1de44dfcae873';
//   late http.Response response;
//   if(email1!=null)
//     {
//       response = await http.patch(
//           Uri.parse(hostUrl + "/api/v1/event/winner/$slug/update"),
//           headers: {'Authorization': "token " + token},
//           body: {"email1": email1.toString(),"email2":"","email3":""});
//     }
//   if(email2!=null)
//   {
//     response = await http.patch(
//         Uri.parse(hostUrl + "/api/v1/event/winner/$slug/update"),
//         headers: {'Authorization': "token " + token},
//         body: {"email2": email2.toString(),"email1":"","email3":""});
//   }
//   if(email3!=null)
//   {
//     response = await http.patch(
//         Uri.parse(hostUrl + "/api/v1/event/winner/$slug/update"),
//         headers: {'Authorization': "token " + token},
//         body: {"email1":"","email2":"","email3": email3.toString()});
//   }
//   print(response.statusCode);
//   return json.decode(response.body);
// }

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
