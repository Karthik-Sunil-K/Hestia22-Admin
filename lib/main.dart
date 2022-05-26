import 'package:flutter/material.dart';
import 'package:hestiaadmin/screens/attendance/api_provider.dart';
import 'package:hestiaadmin/screens/attendance/attendance.dart';
import 'package:hestiaadmin/screens/attendance/team_details.dart';

import 'package:hestiaadmin/screens/bottomnavigation/navbar.dart';
import 'package:hestiaadmin/screens/spot_registration/spot_registration.dart';
import 'package:hestiaadmin/screens/winners/add_winners.dart';
import 'package:hestiaadmin/services/django/google_auth.dart';
import 'package:provider/provider.dart';
import 'screens/login/login.dart';
// import 'package:webview_flutter/webview_flutter.dart';
GoogleAuth auth = GoogleAuth();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiProvider>(
          create: (context) => ApiProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hestia22',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: Replace with provider once backend is up
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  },
                  child: const Text("home")),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Attendance()));
                },
                child: const Text("attendance"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeamDetails()));
                },
                child: const Text("team-details"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SpotRegistration()));
                },
                child: const Text("spot-registration"),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: const Text("login")),
                  ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddWinners()));
                  },
                  child: const Text("Winners")),
            ],
          ),
        ),
      ),
    );
  }
}

class Constants {
  static const Color color1 = Colors.black;
  static const Color color2 = Colors.white;

  static const TextStyle primaryText = TextStyle();
  static const TextStyle secondaryText = TextStyle();
  static const TextStyle tertiaryText = TextStyle();
}
