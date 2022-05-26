import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hestiaadmin/screens/attendance/api_provider.dart';
import 'package:hestiaadmin/screens/attendance/attendance.dart';
import 'package:hestiaadmin/services/django/google_auth.dart';
import 'package:provider/provider.dart';
import 'screens/login/login.dart';

// import 'package:webview_flutter/webview_flutter.dart';
GoogleAuth auth = GoogleAuth();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await auth.initLogin();
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
        // home: ShowWinners(),
        home: StreamBuilder(
            stream: auth.googleSignIn.onCurrentUserChanged,
            builder: (BuildContext context,
                AsyncSnapshot<GoogleSignInAccount?> snapshot) {
              if (auth.token == null || auth.token!.isEmpty) {
                return const LoginPage();
              } else {
                return Attendance();
              }
            }),
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
