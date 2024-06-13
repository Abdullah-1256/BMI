import 'package:bmi/widgets/Icon_btn.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CounterWidget extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final VoidCallback onPressAdd;
  final VoidCallback onPressMinus;
  final double width;
  final double height;

  const CounterWidget(
      {super.key,
      required this.title,
      required this.width,
      required this.height,
      required this.value,
      required this.unit,
      required this.onPressAdd, required this.onPressMinus,});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: (mediaQuery.width / 2) - 35,
      // height: (mediaQuery.height / 3) - 50,
      width: width,
      height: height,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Constants.secondary, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Constants.text),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: value,
                style: const TextStyle(
                    fontSize: 36,
                    color: Constants.text,
                    fontWeight: FontWeight.w600)),
            TextSpan(
              text: " $unit",
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
          ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             IconBtn(onPress: onPressMinus, icon: Icons.remove),
             IconBtn(onPress: onPressAdd, icon: Icons.add),

            ],
          )
        ],
      ),
    );
  }
}
