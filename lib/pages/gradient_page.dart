import 'package:color_generator/common.dart';
import 'package:flutter/material.dart';

/// list of Alignment objects that used in gradient's beginAlignment
final List<Alignment> topAlignments = [
  Alignment.topLeft,
  Alignment.topCenter,
  Alignment.topRight,
];

/// list of Alignment objects that used in gradient's endAlignment
final List<Alignment> bottomAlignments = [
  Alignment.bottomLeft,
  Alignment.bottomCenter,
  Alignment.bottomRight,
];

/// Page displaying gradient on background that changes after tap
class GradientPage extends StatefulWidget {
  ///
  const GradientPage({Key? key}) : super(key: key);

  @override
  State<GradientPage> createState() => _GradientPageState();
}

class _GradientPageState extends State<GradientPage> {
  List<Color> backgroundColors = [];

  final int colorsCount = 2; // can be modified to use colors in gradient
  Alignment beginAlignment = Alignment.topLeft;
  Alignment endAlignment = Alignment.bottomRight;

  @override
  void initState() {
    super.initState();
    setBackgroundGradient();
  }

  /// randomize colors and alignment in gradient
  void setBackgroundGradient() {
    final List<Color> newBackgroundColors = [];
    for (int i = 0; i < colorsCount; i++) {
      newBackgroundColors.add(generateNewColor());
    }

    topAlignments.shuffle();
    bottomAlignments.shuffle();

    beginAlignment = topAlignments.first;
    endAlignment = bottomAlignments.first;
    backgroundColors = newBackgroundColors;
  }

  /// get a string that represents all colors in gradient
  String getGradientHex() {
    final List<String> hexList = [];
    for (final Color color in backgroundColors) {
      hexList.add("#${getColorHex(color)}");
    }

    return hexList.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = getTextColor(backgroundColors.first);

    return GestureDetector(
      onTap: () => setState(setBackgroundGradient),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: beginAlignment,
            end: endAlignment,
            colors: backgroundColors,
          ),
        ),
        duration: const Duration(milliseconds: 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello there again!",
              style: TextStyle(
                color: textColor,
                fontSize: kMainTextSize,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              getGradientHex(),
              style: TextStyle(
                color: textColor,
                fontSize: kHexTextSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
