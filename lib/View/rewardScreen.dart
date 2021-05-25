import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panchprana/Model/model.dart';

class RewardScreen extends StatelessWidget {
  final int index, reward;
  const RewardScreen({Key key, @required this.index, @required this.reward})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: index,
                  child: Icon(
                    Icons.wallet_giftcard_rounded,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Image.asset(
                  rewards[reward].rewardImage,
                  width: 320,
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  rewards[reward].rewardName,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    //copy coupan code to clipboard
                    Clipboard.setData(
                        ClipboardData(text: rewards[reward].rewardCode));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Coupan code copied to clipboard.",
                        textAlign: TextAlign.center,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      rewards[reward].rewardCode,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Click to copy code.",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              iconSize: 30,
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
