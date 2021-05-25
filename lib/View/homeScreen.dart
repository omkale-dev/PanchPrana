import 'package:flutter/material.dart';
import 'package:panchprana/View/PranayamaScreen.dart';
import 'package:panchprana/View/giftScreen.dart';
import 'package:panchprana/View/pranayamaDetail.dart';
import 'package:panchprana/View/recordScreen.dart';
import 'package:panchprana/View/timerScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();

  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        currentIndex: currentPage,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_rounded),
            label: 'Interval Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Pranayamas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.military_tech),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_giftcard_rounded,
            ),
            label: 'Rewards',
          ),
        ],
        onTap: (page) => _pageController.animateToPage(page,
            duration: Duration(milliseconds: 300), curve: Curves.easeIn),
      ),
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        children: [
          TimerScreen(),
          PranayamaScreen(),
          RecordScreen(),
          GiftScreen(),
        ],
      ),
    );
  }
}
