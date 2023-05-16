import 'package:flutter/material.dart';

import '../common.dart';

class SingleColorPage extends StatefulWidget {
  const SingleColorPage({Key? key}) : super(key: key);

  @override
  State<SingleColorPage> createState() => _SingleColorPageState();
}

class _SingleColorPageState extends State<SingleColorPage> {
  late Color backgroundColor;

  @override
  void initState() {
    super.initState();
    refreshBackgroundColor();
  }

  void refreshBackgroundColor() =>
      setState(() => backgroundColor = generateNewColor());

  @override
  Widget build(BuildContext context) {
    Color textColor = getTextColor(backgroundColor);

    return GestureDetector(
      onTap: refreshBackgroundColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello there!",
              style: TextStyle(color: textColor, fontSize: 25),
            ),
            const SizedBox(height: 25),
            Text(
              "#${getColorHex(backgroundColor)}",
              style: TextStyle(color: textColor, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
