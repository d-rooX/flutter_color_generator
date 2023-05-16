import 'dart:math';
import 'package:flutter/material.dart';

// just generates new color using random instance
Color generateNewColor() {
  Random random = Random();
  Color newColor = Color.fromRGBO(
    random.nextInt(255),
    random.nextInt(255),
    random.nextInt(255),
    1,
  );
  return newColor;
}

// returns hex representation of color
String getColorHex(Color color) =>
    color.value.toRadixString(16).replaceRange(0, 2, '').toUpperCase();

// returns text color based on background brightness so it remains readable
Color getTextColor(Color backgroundColor) =>
    backgroundColor.computeLuminance() > 0.3 ? Colors.black : Colors.white;
