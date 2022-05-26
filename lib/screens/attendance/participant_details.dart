import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:hestiaadmin/models/participant.dart';
import 'package:provider/provider.dart';

import '../../models/team.dart';
import 'api_provider.dart';

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

    const gap = SizedBox(
      height: 20,
    );
    const smallGap = SizedBox(
      height: 10,
    );

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.grey.shade900,
            foregroundColor: const Color.fromRGBO(68, 223, 180, 1),
            title: const Text('Team details'),
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

          body: context.watch<ApiProvider>().teamLoading
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(68, 223, 180, 1),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TeamLeader: ' + team!.teamLeader.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(color: Colors.white),
                                ),
                                smallGap,
                                Text(
                                  'email: ' + team.teamLeader.email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  'phone number: ' +
                                      team.teamLeader.phoneNumber,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      gap,
                      Text(
                        'Accepted',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: team.members.accepted.length,
                        itemBuilder: ((context, index) => Card(
                              color: Colors.transparent,
                              child: ListTile(
                                textColor: Colors.white,
                                title: Text(
                                    team.members.accepted[index].user.name),
                                subtitle: Text(
                                    team.members.accepted[index].user.email),
                              ),
                            )),
                      ),
                      gap,
                      Text(
                        'Pending',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: team.members.pending.length,
                        itemBuilder: ((context, index) => Card(
                              color: Colors.transparent,
                              child: ListTile(
                                textColor: Colors.white,
                                title:
                                    Text(team.members.pending[index].user.name),
                                subtitle: Text(
                                    team.members.pending[index].user.email),
                              ),
                            )),
                      ),
                    ],
                  ),
                )),
    );
  }
}
