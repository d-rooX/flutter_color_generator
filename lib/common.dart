import 'dart:math';

import 'package:flutter/material.dart';

/// "Hello there" text font size
const kMainTextSize = 25.0;

/// Color hex font size
const kHexTextSize = 20.0;

/// just generates new color
Color generateNewColor() {
  const maxColorValue = 255;
  final Random random = Random();

  return Color.fromRGBO(
    random.nextInt(maxColorValue),
    random.nextInt(maxColorValue),
    random.nextInt(maxColorValue),
    1,
  );
}

/// returns hex representation of color
String getColorHex(Color color) =>
    color.value.toRadixString(16).replaceRange(0, 2, '').toUpperCase();

/// returns text color based on background brightness so it remains readable
Color getTextColor(Color backgroundColor) =>
    backgroundColor.computeLuminance() > 0.3 ? Colors.black : Colors.white;
