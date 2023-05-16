import 'package:color_generator/pages/gradient.dart';
import 'package:color_generator/pages/single_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ColorApp());
}

class ColorApp extends StatefulWidget {
  const ColorApp({Key? key}) : super(key: key);

  @override
  State<ColorApp> createState() => _ColorAppState();
}

class _ColorAppState extends State<ColorApp>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Tab> tabs = [
    const Tab(text: "Single color", icon: Icon(Icons.invert_colors_on)),
    const Tab(text: "Gradient", icon: Icon(Icons.gradient)),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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
}
