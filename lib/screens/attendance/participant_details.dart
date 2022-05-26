import 'package:flutter/material.dart';

import 'package:hestiaadmin/models/participant.dart';
import 'package:provider/provider.dart';

import '../../models/team.dart';
import 'api_provider.dart';

import 'package:flutter/services.dart';

class ParticipantDetails extends StatelessWidget {
  ParticipantDetails({
    Key? key,
    required this.participant,
  }) : super(key: key);

  bool isInit = true;
  final Participant participant;

  @override
  Widget build(BuildContext context) {
    if (isInit) {
      context.read<ApiProvider>().fetchTeamDetails(participant.slug);
      isInit = false;
    }

    Team? team = context.read<ApiProvider>().team;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.grey.shade900,
            foregroundColor: Colors.white,
            title: const Text('Team Details',style: TextStyle(fontSize: 24),),
          ),
          // body: Column(
          //   // mainAxisAlignment: MainAxisAlignment.center,
          //   // crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text(participant.teamLeader.name),
          //   ],
          // ),
          // body: Center(
          //   child: Text(participant.teamLeader.name),
          // ),

          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              child: context.watch<ApiProvider>().teamLoading
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(68, 223, 180, 1),
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height*0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.03,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.14,
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: participant.teamLeader.email));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration:const Duration(seconds: 1),
                                        content: Text(
                                            participant.teamLeader.email +
                                                ' copied to clipboard')));
                              },
                              child: Card(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      vertical:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width*0.6,
                                            child: Text(
                                              'TeamLeader : ' + team!.teamLeader.name,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                         const Icon(Icons.copy,color: Colors.grey,size: 18,),
                                        ],
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.6,

                                        child: Text('Email : ' + team.teamLeader.email,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white)),
                                      ),
                                      Text(
                                          'Phone number : ' +
                                              team.teamLeader.phoneNumber,

                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(""),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Text(
                              'Request Accepted',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: team.members.accepted.length,
                            itemBuilder: ((context, index) => Card(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    textColor: Colors.white,
                                    title: Text(
                                        team.members.accepted[index].user.name,style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize: 16,
                                    )),
                                    subtitle: Text(team
                                        .members.accepted[index].user.email,style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: Text(
                              'Request Pending',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: team.members.pending.length,
                            itemBuilder: ((context, index) => Card(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    textColor: Colors.white,
                                    title: Text(
                                        team.members.pending[index].user.name,style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),),
                                    subtitle: Text(
                                        team.members.pending[index].user.email,style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
            ),
          )),
    );
  }
}
