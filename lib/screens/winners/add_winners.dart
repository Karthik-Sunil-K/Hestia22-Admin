import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../attendance/api_provider.dart';

class AddWinners extends StatefulWidget {
  String slug;
  AddWinners({Key? key, required this.slug}) : super(key: key);
  @override
  State<AddWinners> createState() => _AddWinnersState();
}

class _AddWinnersState extends State<AddWinners> {
  static bool start = false;
  String? email1, email2, email3;
  Map<dynamic, dynamic> winners = {};
   bool loading=true;
  final TextEditingController _textEditingController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    winners = context.read<ApiProvider>().winners;
    loading =context.watch<ApiProvider>().winnersLoading;
    email1=winners['winner1'] != null
        ? winners['winner1']['team_leader']['email']
        : '';
    email2=winners['winner2'] != null
        ? winners['winner2']['team_leader']['email']
        : '';
    email3=winners['winner3'] != null
        ? winners['winner3']['team_leader']['email']
        : '';
  }

  final gap = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body:loading ? Center(child: const CircularProgressIndicator()): Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.1),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Center(
                  child: Text(
                "Add Winners",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(
                height: size.height * 0.08,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    label: const Text(
                      'First Prize',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                   email1= value;
                },
                initialValue: winners['winner1'] != null
                    ? winners['winner1']['team_leader']['email']
                    : '',
              ),
              gap,
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    label: const Text(
                      'Second Prize',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  email2= value;
                },
                initialValue: winners['winner2'] != null
                    ? winners['winner2']['team_leader']['email']
                    : '',
              ),
              gap,
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    label: const Text(
                      'Third Prize',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20))),
                onChanged: (value) {
                  email3= value;
                },
                initialValue: winners['winner3'] != null
                    ? winners['winner3']['team_leader']['email']
                    : '',
              ),
              gap,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () async {
                    print("value $email1,$email2,$email3");
                    if (email1 == null && email2 == null && email3 == null) {
                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text("Winners cannot be empty"),
                                titleTextStyle: const TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.grey.shade900,
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Close",
                                        style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ));
                    } else {
                      Map result = await auth.putWinners(
                          email1, email2, email3, widget.slug);
                      String msg = "";

                      if (result.containsKey('detail')) {
                        msg = result['detail'].toString();
                      }
                      if (result.containsKey('email1')) {
                        msg += "First Prize : " +
                            result['email1'][0].toString() +
                            "\n";
                      }
                      if (result.containsKey('email2')) {
                        msg += "Second Prize : " +
                            result['email2'][0].toString() +
                            "\n";
                      }
                      if (result.containsKey('email3')) {
                        msg +=
                            "Third Prize : " + result['email3'][0].toString();
                      }

                      return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(result['status_code'] == 200
                                    ? result['detail']
                                    : msg),
                                titleTextStyle: const TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.grey.shade900,
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Close",
                                        style: TextStyle(
                                          fontFamily: 'Helvetica',
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ));
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  final String hintText;
  // final VoidCallback valueChanged;
  final Function(String?) valueChanged;
  final String? errorText;
  final String? initialValue;
  final TextInputType? keyboard;
  const _TextField({
    Key? key,
    required this.hintText,
    required this.valueChanged,
    this.errorText,
    this.initialValue,
    this.keyboard,
  }) : super(key: key);

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool start = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200)).then(
      (value) => setState(() {
        start = true;
      }),
    );
  }

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 50,
      child: TextFormField(
        controller: _textEditingController,
        initialValue: widget.initialValue,
        onChanged: widget.valueChanged,
        scrollPhysics: const BouncingScrollPhysics(),
        cursorColor: Colors.white,
        cursorRadius: const Radius.circular(10),
        style: const TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 15,
        ),
        textCapitalization: TextCapitalization.words,
        keyboardType: widget.keyboard,
        decoration: InputDecoration(
          errorText: widget.errorText,
          hintText: 'Enter Email Id',
          labelText: widget.hintText,
          labelStyle: const TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w100,
          ),
          hintStyle: const TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w100,
          ),
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          fillColor: Colors.grey.withOpacity(.05),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
