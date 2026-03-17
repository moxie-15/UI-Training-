import 'package:bmi/pages/homepage.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:
            true, // Pro-tip: Use this instead of wrapping Text in a Center widget
        title: const Text('BMI Result', style: TextStyle(color: Colors.white)),
        backgroundColor: activeCardColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // 1. TOP SECTION: The Result Card
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              // cardChild goes INSIDE ReusableCard!
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Normal',
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '18.3',
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your BMI result is quite low. You should eat more.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),

          // 2. BOTTOM SECTION: The Re-Calculate Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10.0,
                ), // Give it some breathing room from the card
                color: const Color(0xFFEB1555),
                child: const Center(
                  child: Text(
                    'Re-Calculate',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
