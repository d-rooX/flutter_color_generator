import 'package:color_generator/common.dart';
import 'package:flutter/material.dart';

/// Page that shows exactly one color on a whole screen
class SingleColorPage extends StatefulWidget {
  ///
  const SingleColorPage({Key? key}) : super(key: key);

  @override
  State<SingleColorPage> createState() => _SingleColorPageState();
}

class _SingleColorPageState extends State<SingleColorPage> {
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    super.initState();
    backgroundColor = generateNewColor();
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = getTextColor(backgroundColor);

    return GestureDetector(
      onTap: () => setState(() => backgroundColor = generateNewColor()),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello there!",
              style: TextStyle(color: textColor, fontSize: kMainTextSize),
            ),
            const SizedBox(height: 25),
            Text(
              "#${getColorHex(backgroundColor)}",
              style: TextStyle(color: textColor, fontSize: kHexTextSize),
            )
          ],
        ),
      ),
    );
  }
}
