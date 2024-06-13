import 'package:flutter/material.dart';

import '../constants.dart';

class IconBtn extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  const IconBtn({super.key, required this.onPress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Constants.accent;
          }
          return Constants.btn;
        }),
      ),
    );
  }
}
