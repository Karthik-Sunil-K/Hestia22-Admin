import 'package:flutter/material.dart';
import 'package:hestiaadmin/models/event.dart';
import 'package:provider/provider.dart';

import '../attendance/api_provider.dart';

class ShowWinners extends StatelessWidget {
  ShowWinners({Key? key, required this.event}) : super(key: key);
  final Event event;
  bool isInit = true;

  final gap = const SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final winners = context.read<ApiProvider>().winners;

    if (isInit) {
      context.read<ApiProvider>().fetchWinners(event.slug);
      isInit = false;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.1),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: context.watch<ApiProvider>().winnersLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(68, 223, 180, 1),),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text(
                      "Show Winners",
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
                    const Text(
                      'Winner 1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      winners['winner1'] == null
                          ? 'Name : Not updated'
                          : 'Name : ${winners['winner1']['team_leader']['name']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    gap,
                    Text(
                      winners['winner1'] == null
                          ? 'Email : Not updated'
                          : 'Email : ${winners['winner1']['team_leader']['email']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Text(
                      'Winner 2',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      winners['winner2'] == null
                          ? 'Name : Not updated'
                          : 'Name : ${winners['winner2']['team_leader']['name']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    gap,
                    Text(
                      winners['winner2'] == null
                          ? 'Email : Not updated'
                          : 'Email : ${winners['winner2']['team_leader']['email']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Text(
                      'Winner 3',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      winners['winner3'] == null
                          ? 'Name : Not updated'
                          : 'Name : ${winners['winner3']['team_leader']['name']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    gap,
                    Text(
                      winners['winner3'] == null
                          ? 'Email : Not updated'
                          : 'Email : ${winners['winner3']['team_leader']['email']}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    gap,
                  ],
                ),
        ),
      ),
    );
  }
}
