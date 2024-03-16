import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/cool_tab_bar.dart';
import 'package:bestest_calculator/calculator_page/calculator_main.dart';
import 'package:bestest_calculator/converter_page/converter_main.dart';
class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});
  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          CoolTabBar(
              tabController: _tabController
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              //physics: const NeverScrollableScrollPhysics(),
              children: const <Widget>[
                CalculatorPage(),
                ConverterPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}