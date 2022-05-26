import 'package:flutter/material.dart';
import 'package:hestiaadmin/main.dart';
import 'package:hestiaadmin/screens/attendance/api_provider.dart';
import 'package:hestiaadmin/screens/direction/director.dart';
import 'package:provider/provider.dart';

import '../../models/event.dart';
import '../login/login.dart';

class Attendance extends StatelessWidget {
  bool isInit = true;
  Attendance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (isInit) {
        isInit = false;
        context.read<ApiProvider>().fetchEvents();
      }
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 150,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.6,
                              child: Text(
                                "Welcome ${auth.googleSignIn.currentUser?.displayName ?? ""}  ",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Helvetica',
                                  color: Colors.white, fontSize: 18
                                ),
                              ),
                            ),
                            Image.asset(
                              "assets/wave.gif",
                              height: MediaQuery.of(context).size.height * .035,
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.height * .032,
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(onPressed: ()async{
                      Future.delayed(const Duration(milliseconds: 800),
                              () async {
                            await auth.logOut();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                          });
                    }, icon:const Icon(Icons.logout))
                  ],
                ),
                const Text(
                  "\nYour Events",
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ],

            ),
          ),
          backgroundColor: Colors.grey.shade900,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.005),
            child: context.watch<ApiProvider>().eventsLoading
                ?  const Center(
                    child:CircularProgressIndicator(

                      color: Color.fromRGBO(68, 223, 180, 1),
                    ),
                  )
                : context.watch<ApiProvider>().events.isEmpty ? const Center(
                  child:  Text("No Events",style: TextStyle(
              color: Colors.white,

            ),),
                ) : ListView.builder(
              physics: const BouncingScrollPhysics(),
                    itemCount: context.watch<ApiProvider>().events.length,
                    itemBuilder: (BuildContext context, int index) => EventCard(
                      event: context.read<ApiProvider>().events[index],
                    ),
                  ),
          ),
        ),
      );
    });
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => Director(
                  eventDetails: event,
                ))));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
        width: double.infinity,
        child: Card(
          color: Colors.grey.shade800,
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.03),
            child: Center(
              child: Text(
                event.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
