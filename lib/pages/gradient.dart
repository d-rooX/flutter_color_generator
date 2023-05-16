import 'package:color_generator/common.dart';
import 'package:flutter/material.dart';

final List<Alignment> topAlignments = [
  Alignment.topLeft,
  Alignment.topCenter,
  Alignment.topRight,
];
final List<Alignment> bottomAlignments = [
  Alignment.bottomLeft,
  Alignment.bottomCenter,
  Alignment.bottomRight,
];

class GradientPage extends StatefulWidget {
  const GradientPage({Key? key}) : super(key: key);

  @override
  State<GradientPage> createState() => _GradientPageState();
}

class _GradientPageState extends State<GradientPage> {
  List<Color> backgroundColors = [];

  final int colorsCount = 2; // can be modified to add more colors to gradient
  late Alignment beginAlignment;
  late Alignment endAlignment;

  @override
  void initState() {
    super.initState();
    refreshBackgroundGradient();
  }

  // randomize colors and alignment in gradient
  void refreshBackgroundGradient() {
    List<Color> newBackgroundColors = [];
    for (int i = 0; i < colorsCount; i++) {
      newBackgroundColors.add(generateNewColor());
    }

    topAlignments.shuffle();
    bottomAlignments.shuffle();

    setState(() {
      beginAlignment = topAlignments.first;
      endAlignment = bottomAlignments.first;
      backgroundColors = newBackgroundColors;
    });
  }

  // get a string that represents all colors in gradient
  String getGradientHex() {
    List<String> hexList = [];
    for (Color color in backgroundColors) {
      hexList.add("#${getColorHex(color)}");
    }
    return hexList.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = getTextColor(backgroundColors.first);

    return GestureDetector(
      onTap: refreshBackgroundGradient,
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
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              getGradientHex(),
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
