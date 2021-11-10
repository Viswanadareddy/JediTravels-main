import 'package:flutter/material.dart';
import 'package:loginout/constants.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Offers',
              style: TextStyle(fontSize: 22, color: Constants.textColor)),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Constants.buttonColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10),
            Image.asset('assets/offers/first.jpeg'),
            SizedBox(height: 20),
            Image.asset('assets/offers/second.jpeg'),
            SizedBox(height: 20),
            Image.asset('assets/offers/third.jpeg'),
          ],
        ),
      ),
    );
  }
}
