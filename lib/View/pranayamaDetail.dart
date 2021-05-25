import 'package:flutter/material.dart';
import 'package:panchprana/Model/model.dart';

class PranayamaDetail extends StatelessWidget {
  final int index;

  const PranayamaDetail({Key key, @required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: [
          Stack(
            children: [
              Hero(
                  tag: index,
                  child: Image.asset(
                    pranayamas[index].image1,
                    fit: BoxFit.contain,
                  )),
              Positioned(
                top: 40,
                left: 20,
                child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30,
                    onPressed: () => Navigator.of(context).pop()),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pranayamas[index].name,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(
            endIndent: 50,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Reps: " + pranayamas[index].reps,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Steps: " + pranayamas[index].steps,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Benefits: " + pranayamas[index].benefits,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.italic)),
          )
        ],
      ),
    );
  }
}
