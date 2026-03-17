import 'package:bmi/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:bmi/pages/constant.dart';
// Note: Make sure to import ReusableCard from wherever you saved it!
// import 'package:bmi/components/reusable_card.dart'; 

class Result extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const Result({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI Result',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: activeCardColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeCardColor,
              // REMOVED 'const' here so we can dynamically inject our widget data
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.resultText.toUpperCase(), // Dynamically calling the result (e.g., "NORMAL")
                    style: const TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.bmiResult, // Dynamically calling the actual number (e.g., "22.5")
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.interpretation, // Dynamically calling the advice string
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          
          // Streamlined Re-Calculate Button
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back to the previous page
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFEB1555), // Let's migrate this to constant.dart soon!
                ),
                child: const Center(
                  child: Text(
                    'RE-CALCULATE',
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