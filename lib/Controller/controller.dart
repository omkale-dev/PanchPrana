import 'package:shared_preferences/shared_preferences.dart';

// increment the score
incrementScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  await prefs.setInt('counter', counter);
}

//get the score
Future<int> getScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0);
  return counter;
}

// reset the score
Future<bool> resetScore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool response = await prefs.remove('counter');
  return response;
}
