import 'package:flutter/material.dart';
import 'package:panchprana/Controller/controller.dart';

class RecordScreen extends StatefulWidget {
  @override
  _RecordScreenState createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  int score = 0;
  @override
  void initState() {
    super.initState();
    getScore().then((value) => score = value);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: Center(
        child: Card(
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Score",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    score.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text("${score * 10} minutes of pranayama done."),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //reset score
                        resetScore().then((value) => print("Reset:$value"));
                        setState(() {
                          score = 0;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Progress was successfully reset.",
                            textAlign: TextAlign.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          behavior: SnackBarBehavior.floating,
                        ));
                      },
                      child: Text("Reset Score"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
