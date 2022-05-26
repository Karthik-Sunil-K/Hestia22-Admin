import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddWinners extends StatefulWidget {
  final List<dynamic>? a;
  const AddWinners({Key? key, this.a}) : super(key: key);

  @override
  State<AddWinners> createState() => _AddWinnersState();
}

class _AddWinnersState extends State<AddWinners> {

  
  static bool start = false;

  final TextEditingController _textEditingController = TextEditingController();

  List<String> _getSuggestions(String pattern) {
    List<String> list = []; 
    if (widget.a != null) {
      for (var map in widget.a!) {
        if (list.length < 4) {
          if (map['title'].toLowerCase().contains(pattern.toLowerCase())) {
            list.add(map['title']);
            if (list.length == 4) {
              break;
            }
          }
        }
      }
      return list;
    } else {
      return list;
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 150), () {
      if (mounted) {
        setState(() {
          start = true;
        });
      }
    });
  }
  final gap = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 100),
          child: Column(
            children: [
              // AnimatedPadding(
              //   duration: const Duration(seconds: 1),
              //   curve: Curves.decelerate,
              //   padding: start
              //       ? const EdgeInsets.only(left: 20, right: 20)
              //       : const EdgeInsets.only(left: 10, right: 10),
              //   child: AnimatedOpacity(
              //     duration: const Duration(seconds: 1),
              //     curve: Curves.decelerate,
              //     opacity: start ? 1 : 0,
              //     child: AnimatedContainer(
              //       duration: const Duration(seconds: 1),
              //       curve: Curves.fastLinearToSlowEaseIn,
              //       height: size.height * .065,
              //       width: size.width * .92,
              //       decoration: BoxDecoration(
              //         color: Colors.grey.withOpacity(.05),
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 20),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Expanded(
              //               child: AnimatedPadding(
              //                 duration: const Duration(seconds: 1),
              //                 curve: Curves.decelerate,
              //                 padding: start
              //                     ? const EdgeInsets.only(left: 0)
              //                     : const EdgeInsets.only(left: 10),
              //                 child: TypeAheadField(
              //                   textFieldConfiguration: TextFieldConfiguration(
              //                     controller: _textEditingController,
              //                     style: const TextStyle(color: Colors.grey),
              //                     cursorColor: Colors.white,
              //                     cursorRadius: const Radius.circular(10),
              //                     textCapitalization:
              //                         TextCapitalization.sentences,
              //                     decoration: InputDecoration(
              //                       focusedBorder: const OutlineInputBorder(
              //                           borderRadius: BorderRadius.all(
              //                               Radius.circular(5.0)),
              //                           borderSide:
              //                               BorderSide(color: Colors.grey)),
              //                       icon: AnimatedPadding(
              //                         duration: const Duration(seconds: 1),
              //                         curve: Curves.decelerate,
              //                         padding: start
              //                             ? const EdgeInsets.only(left: 0)
              //                             : const EdgeInsets.only(left: 20),
              //                         child: const Text(
              //                           'First: ', style: TextStyle(color: Colors.white),
              //                         ),
              //                       ),
              //                       hintText: "Team Leader Name",
              //                       hintStyle: const TextStyle(
              //                         fontFamily: 'Helvetica',
              //                         color: Colors.grey,
              //                         fontSize: 16,
              //                         fontWeight: FontWeight.w400,
              //                       ),
              //                       hoverColor: Colors.transparent,
              //                       focusColor: Colors.transparent,
              //                       border: InputBorder.none,
              //                       contentPadding: const EdgeInsets.all(0),
              //                     ),
              //                   ),
              //                   suggestionsBoxDecoration:
              //                       SuggestionsBoxDecoration(
              //                     color: Colors.black,
              //                     borderRadius: BorderRadius.circular(10),
              //                   ),
              //                   itemBuilder: (BuildContext context, suggestion) {
              //                     return ListTile(
              //                       onTap: () {
              //                         // for (var map in widget.a!) {
              //                         //   if (map['title'] ==
              //                         //       suggestion.toString()) {
              //                         //     Navigator.push(
              //                         //         context,
              //                         //         MaterialPageRoute(
              //                         //             builder: (context) =>
              //                         //                 EventDetails(
              //                         //                     map)));
              //                         //   }
              //                         // }
              //                       },
              //                       title: Text(
              //                         suggestion.toString(),
              //                         style: const TextStyle(
              //                           color: Colors.white,
              //                           fontFamily: "Helvetica",
              //                           fontSize: 12,
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                     );
              //                   },
              //                   suggestionsCallback: (String pattern) async {
              //                     return _getSuggestions(pattern);
              //                   },
              //                   hideOnError: true,
              //                   hideOnEmpty: true,
              //                   hideOnLoading: true,
              //                   hideSuggestionsOnKeyboardHide: true,
              //                   onSuggestionSelected: (String suggestion) {},
              //                 ),
              //               ),
              //             ),
              //             AnimatedOpacity(
              //               duration: const Duration(milliseconds: 1800),
              //               curve: Curves.decelerate,
              //               opacity: start ? 1 : 0,
              //               child: GestureDetector(
              //                 onTap: () {
              //                   //if (mounted) {
              //                   //  setState(() {
              //                   //     FocusManager.instance.primaryFocus
              //                   //        ?.unfocus();
              //                   //  });
              //                   //}
              //                 },
              //                 child: AnimatedContainer(
              //                   duration: const Duration(seconds: 1),
              //                   curve: Curves.decelerate,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(10),
              //                   ),
              //                   height: size.height * .05,
              //                   width: size.width * .05,
              //                   child: const Icon(
              //                     FontAwesomeIcons.sliders,
              //                     size: 18,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              _TextField(hintText: 'First Prize', valueChanged: (_) {}),
                gap,
                _TextField(hintText: 'Second Prize', valueChanged: (_) {}),
                gap,
                _TextField(hintText: 'Third Prize', valueChanged: (_) {}),
                gap,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(68, 223, 180, 1),
                  ),
                  onPressed: () {},
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

