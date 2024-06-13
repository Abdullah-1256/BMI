import 'package:bmi/model/bmi.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultScreen extends StatelessWidget {
  final UserValue user;

  ResultScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primary,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Constants.primary,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              "Your Result",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Constants.secondary,
                  borderRadius: BorderRadius.circular(5)),
              width: double.infinity,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(user.classification,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                  Text(user.result.toStringAsFixed(2),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 100,
                          fontWeight: FontWeight.bold)),
                  Text(user.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Constants.accent,
                    minimumSize: Size.infinite,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "RE-Calculate".toUpperCase(),
                  style: const TextStyle(
                      color: Constants.text,
                      fontSize: 35,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
