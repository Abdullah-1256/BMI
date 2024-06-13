import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  bool isSelect;
  final IconData icon;
  final String title;
  final VoidCallback onPress;
  final double width;
  final double height;

  GenderWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPress,
    required this.width,
    required this.height,
    this.isSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isSelect ? Constants.accent : Constants.primary_2,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            const SizedBox(height: 5),
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Constants.text),
            )
          ],
        ),
      ),
    );
  }
}
