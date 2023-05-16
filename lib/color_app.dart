import 'package:color_generator/pages/gradient_page.dart';
import 'package:color_generator/pages/single_color_page.dart';
import 'package:flutter/material.dart';

/// Main Widget
class ColorApp extends StatefulWidget {
  ///
  const ColorApp({Key? key}) : super(key: key);

  @override
  State<ColorApp> createState() => _ColorAppState();
}

class _ColorAppState extends State<ColorApp>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = [
    Tab(text: "Single color", icon: Icon(Icons.invert_colors_on)),
    Tab(text: "Gradient", icon: Icon(Icons.gradient)),
  ];

  // need to use late here as in docs
  // https://api.flutter.dev/flutter/material/TabController-class.html#material.TabController.1
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Colors app"),
          bottom: TabBar(
            controller: tabController,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            SingleColorPage(),
            GradientPage(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
