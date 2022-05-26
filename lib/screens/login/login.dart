import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hestiaadmin/main.dart' as main;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _text = "Continue with Google";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                height: screenHeight * 0.35,
                width: screenWidth * 0.35,
                child: Image.asset("assets/applogo.gif"),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff121212),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    height: screenHeight*0.075,
                    width: screenWidth*0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: RoundedButton(
                        text: _text,
                        press: () async {
                          setState(() {
                            _text = 'Logging you in...';
                          });
                          if (await main.auth.login()) {
                            setState(() {
                              _text = 'Logged in';
                            });
                          } else {
                            _text = 'Error logging in...';

                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              setState(() {
                                _text = 'Try again...';
                              });
                            });

                            Future.delayed(const Duration(milliseconds: 2500),
                                () {
                              setState(() {
                                _text = 'Continue with Google';
                              });
                            });
                          }
                        },
                      ),
                    ),
                  ),
                   SizedBox(
                    height: screenHeight*0.08,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//rounded button

class RoundedButton extends StatelessWidget {
  final String text;
  final Color? color, textColor;
  final void Function() press;
  const RoundedButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.color,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            //color: Colors.blue,
            child: Lottie.network(
              'https://assets6.lottiefiles.com/private_files/lf30_3nvqj06a.json',
              width: 50,
              height: 80,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Helvetica',
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
