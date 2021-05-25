import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:panchprana/Controller/controller.dart';
import 'package:panchprana/Model/model.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

enum TtsState { playing, stopped, paused, continued }

class _TimerScreenState extends State<TimerScreen> {
  int _counter;
  bool _timerON = false;
  Timer _timer;
  int _currentActivity = 0;
  FlutterTts flutterTts;
  TtsState ttsState;
  bool _completed = false;
  _startTimer() {
    //checking if the widget is mounted before the setstate prevents memory leaks
    //as user can switch the tab after staring the timer.
    if (mounted) {
      setState(() {
        //hide the play button
        _timerON = true;
        //set the counter to first activity duration in the flow
        _counter = flow[_currentActivity].duration;
        _speak(text: flow[_currentActivity].nameOfActivity);
      });
    } else {
      return;
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter == 0) {
        if (mounted) {
          setState(
            () {
              //change current activity
              //if its last activity then cancel the timer and reset
              if (_currentActivity < flow.length - 1) {
                _currentActivity++;
                _speak(text: flow[_currentActivity].nameOfActivity);
              } else {
                _timer.cancel();
                // enable the button again for new streak of workout
                _timerON = false;
                _speak(
                    text:
                        "Congratulations!, You have successfully completed the workout");
                _completed = true;

                //save the progress
                incrementScore();
                _currentActivity = 0;
              }

              //set the counter to duration of current activity
              _counter = flow[_currentActivity].duration;
            },
          );
        } else {
          return;
        }
      } else {
        setState(() {
          _counter = _counter - 1;
          //play beeps at the end of the activity
          // this beep sound may not work if you are on desktop
          // it works fine in physical device
          if (_counter == 3 || _counter == 2 || _counter == 1) {
            FlutterBeep.beep();
          } else {}
          if (_counter == 0) {
            FlutterBeep.beep(false);
          }
        });
      }
    });
  }

// initialization for tts iOS
  Future<void> iosTtsInit() async {
    await flutterTts.setSharedInstance(true);
    await flutterTts
        .setIosAudioCategory(IosTextToSpeechAudioCategory.playAndRecord, [
      IosTextToSpeechAudioCategoryOptions.allowBluetooth,
      IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
      IosTextToSpeechAudioCategoryOptions.mixWithOthers
    ]);
    await flutterTts.awaitSpeakCompletion(true);
  }

//start speaking
  Future _speak({text}) async {
    var result = await flutterTts
        .speak(text)
        .onError((error, stackTrace) => print(error))
        .whenComplete(() => setState(() => ttsState = TtsState.stopped));

    if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  @override
  void initState() {
    flutterTts = FlutterTts();
    iosTtsInit();
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: _completed
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wallet_giftcard_rounded,
                    size: 90,
                  ),
                  Text(
                    "Congratulations!",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Check what you have unlocked in reward section.")
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "logoImage",
                      child: Image.asset(
                        'assets/logo.png',
                        height: 300,
                      ),
                    ),
                    Text(
                      flow[_currentActivity].nameOfActivity,
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    !_timerON
                        ? IconButton(
                            iconSize: 60,
                            icon: Icon(
                              Icons.play_arrow,
                            ),
                            onPressed: () {
                              //start the interval timer
                              _startTimer();
                            })
                        : Text(
                            "$_counter",
                            style: TextStyle(
                              fontSize: 60,
                            ),
                          ),
                    _currentActivity < flow.length - 1
                        ? Text(
                            'Up next: ${flow[_currentActivity + 1].nameOfActivity}')
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Made with "),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        Text(" by OM KALE")
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Note: I have set the workout time to 5 sec for testing.\n You can increase it at lib/Model/model.dart',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
