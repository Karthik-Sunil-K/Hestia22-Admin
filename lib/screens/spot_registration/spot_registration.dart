import 'package:flutter/material.dart';

class SpotRegistration extends StatelessWidget {
  const SpotRegistration({Key? key}) : super(key: key);

  final gap = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              gap,
              Text(
                'Spot Registration',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.white),
                // style: TextStyle(
                //   color: Colors.white,
                // ),
              ),
              gap,
              gap,
              _TextField(hintText: 'hintText', valueChanged: (_) {}),
              gap,
              _TextField(hintText: 'hintText', valueChanged: (_) {}),
              gap,
              _TextField(hintText: 'hintText', valueChanged: (_) {}),
              gap,
              _TextField(hintText: 'hintText', valueChanged: (_) {}),
              gap,
              _TextField(hintText: 'hintText', valueChanged: (_) {}),
              gap,
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

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        initialValue: widget.initialValue,
        onChanged: widget.valueChanged,
        scrollPhysics: const BouncingScrollPhysics(),
        cursorColor: Colors.white,
        cursorRadius: const Radius.circular(10),
        style: const TextStyle(
          fontFamily: 'Helvetica',
          color: Colors.white,
          fontSize: 20,
        ),
        textCapitalization: TextCapitalization.words,
        keyboardType: widget.keyboard,
        decoration: InputDecoration(
          errorText: widget.errorText,
          hintText: 'type here',
          labelText: widget.hintText,
          labelStyle: const TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w100,
          ),
          hintStyle: const TextStyle(
            fontFamily: 'Helvetica',
            color: Colors.white,
            fontSize: 20,
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
