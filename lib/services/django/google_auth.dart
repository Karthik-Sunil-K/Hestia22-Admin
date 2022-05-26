import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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


  
  
}
