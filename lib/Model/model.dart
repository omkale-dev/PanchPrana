import 'package:flutter/material.dart';

List<Pranayama> _pranayamas = [
  Pranayama(
      name: "ANULOM VILOM",
      steps:
          "Close your eyes and sit in Padmasana. Use the right thumb to close the right nostril. Inhale slowly through the left nostril, taking in as much air as you can to fill your lungs. Remove the thumb from your right nostril and exhale. While exhaling, use the middle finger to close your left nostril and inhale with our right nostril. Remove the thumb from the right nostril and exhale.",
      reps: "Perform for 2-5 minutes",
      image1: 'assets/Pranayama/anulom1.jpg',
      benefits:
          "This pranayama helps normalise blood pressure, aids in blood purification, reduced risk of heart disease and can also improve sight."),
  Pranayama(
      name: "BHRAMARI",
      steps:
          "Close your ears with your thumbs and place your index fingers on the temple. Close eyes with the other three fingers. Gently inhale through the nose and hold for a few seconds. Keeping the mouth closed, exhale by making a humming sound.",
      reps: "5 times",
      image1: 'assets/Pranayama/bhramari1.jpg',
      benefits:
          "It can calm your mind down instantly and is one of the best breathing exercises to distress as it rids the mind of frustration, anxiety, anger or agitation."),
  Pranayama(
      name: "UJJAYI",
      steps:
          "Begin by inhaling and exhaling naturally. Bend down your head, blocking the free flow of air and inhale as long as you can, making a sound from your throat. Hold for 2-5 seconds. Close your right nostril with your right thumb while exhaling and breathe out through the left nostril.",
      reps: "10-12 times in as much time you need.",
      image1: 'assets/Pranayama/ujjayi1.jpg',
      benefits:
          "The sound vibrations that are a part of this pranayama sharpen the focus of your mind can help cure thyroid and reduce snoring."),
  Pranayama(
      name: "KAPALBHATHI",
      steps:
          "This breathing technique involves passive inhalation and active exhalation. So inhale normally, breathing in as much air as you can, and exhale forcefully. Try and pull your stomach muscles as closely as you can towards the backbone during exhalation.",
      reps: "Perform for 2-5 minutes",
      image1: 'assets/Pranayama/kapalbhati1.jpg',
      benefits:
          "This pranayama can improve the functioning of all abdominal organs, reduces belly fat, lead to quick weight loss and balances sugar levels in your body."),
  Pranayama(
      name: "BHASTRIKA",
      steps:
          "Take a deep breath in, inhaling as much air as you can, and expand your stomach. Exhale the air out with force and try and pull your navel in towards the backbone.",
      reps: "Repeat for 1-2 minutes and rest for a while afterwards",
      image1: 'assets/Pranayama/bhastrika1.png',
      benefits:
          "Perform this breathing technique to strengthen your lungs, burn excess fat, improve physical and mental ability and clear the windpipe."),
];

List<Pranayama> get pranayamas => _pranayamas;

class Pranayama {
  final String name;
  final String steps;
  final String reps;
  final String image1;
  final String image2;
  final String image3;
  final String benefits;

  Pranayama({
    @required this.name,
    @required this.steps,
    @required this.reps,
    @required this.image1,
    this.image2,
    this.image3,
    @required this.benefits,
  });
}

List<FlowItem> _flow = [
  //by default duration of all the activities will be 5 sec
  FlowItem(nameOfActivity: "Anulom Vilom"),
  FlowItem(nameOfActivity: "Rest", duration: 5),
  FlowItem(nameOfActivity: "Bhramari"),
  FlowItem(nameOfActivity: "Rest", duration: 5),
  FlowItem(nameOfActivity: "Ujjayi"),
  FlowItem(nameOfActivity: "Rest", duration: 5),
  FlowItem(nameOfActivity: "Kapalbhati"),
  FlowItem(nameOfActivity: "Rest", duration: 5),
  FlowItem(nameOfActivity: "Bhastrika"),
];

List<FlowItem> get flow => _flow;

class FlowItem {
  final int duration;
  final String nameOfActivity;

  FlowItem({this.duration = 5, @required this.nameOfActivity});
}

List<Reward> _rewards = [
  Reward(
      rewardImage: 'assets/Coupan Images/amazon.png',
      rewardName: "70% off on health deals",
      rewardCode: "PanchPrana70"),
  Reward(
      rewardImage: 'assets/Coupan Images/firstcry.png',
      rewardName: "40% off on kids deals",
      rewardCode: "PanchPranaCry40"),
  Reward(
      rewardImage: 'assets/Coupan Images/flipkart.png',
      rewardName: "75% off on health deals",
      rewardCode: "PanchPrana75"),
  Reward(
      rewardImage: 'assets/Coupan Images/mamaearth.png',
      rewardName: "30% off on ayurvedic deals",
      rewardCode: "PanchPranaMama30"),
  Reward(
      rewardImage: 'assets/Coupan Images/myntra.png',
      rewardName: "80% off on yoga wear",
      rewardCode: "PanchPranaYogaWear"),
  Reward(
      rewardImage: 'assets/Coupan Images/zomato.png',
      rewardName: "Buy 1 get 1 free.",
      rewardCode: "PanchPranaHungry"),
];
List<Reward> get rewards => _rewards;

class Reward {
  final String rewardImage;
  final String rewardName;
  final String rewardCode;

  Reward(
      {@required this.rewardImage,
      @required this.rewardName,
      @required this.rewardCode});
}
