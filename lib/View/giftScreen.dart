import 'dart:math';

import 'package:flutter/material.dart';
import 'package:panchprana/Controller/controller.dart';
import 'package:panchprana/Model/model.dart';
import 'package:panchprana/View/rewardScreen.dart';
import 'package:timelines/timelines.dart';

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  int score = 0;
  @override
  void initState() {
    setScore();
    super.initState();
  }

  //set score
  setScore() async {
    int response = await getScore();
    setState(() {
      score = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.grey[100],
        child: score != 0
            ? Timeline.tileBuilder(
                reverse: true,
                physics: BouncingScrollPhysics(),
                builder: TimelineTileBuilder.fromStyle(
                  contentsAlign: ContentsAlign.alternating,
                  connectorStyle: ConnectorStyle.solidLine,
                  indicatorStyle: IndicatorStyle.dot,
                  contentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GestureDetector(
                      onTap: () {
                        //if its current reward then open
                        if (index == score - 1) {
                          //open gift screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => RewardScreen(
                                      index: index,
                                      //generated random reward from list of rewards
                                      reward: Random().nextInt(rewards.length),
                                    )),
                          );
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: index == score - 1
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Text(
                                'Reward for set ${index + 1}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Hero(
                                tag: index,
                                child: Icon(
                                  Icons.wallet_giftcard_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  itemCount: score,
                ),
              )
            : Center(
                child: Text(
                    "Please complete atleast one set of workout to get an reward."),
              ));
  }
}
