import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/ui_constants.dart';

/// This class is a StatefulWidget that creates a TabBar
/// I created a separate class for the TabBar to make the code more readable
class CoolTabBar extends StatefulWidget {
  const CoolTabBar({super.key, required this.tabController});
  final TabController tabController;
  @override
  CoolTabBarState createState() => CoolTabBarState();
}

class CoolTabBarState extends State<CoolTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container( /// Encase the TabBar in a Container to control its appearance with ease
      width: screenWidth(context) * 0.97,
      height: screenHeight(context) * 0.05,
      decoration: BoxDecoration(
        color: BoringGray,
        borderRadius: BorderRadius.circular(4.0), // This rounds the edges

      ),
      child: TabBar(
        controller: widget.tabController,
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: ActiveBlue,
          borderRadius: myBorderRadius(widget.tabController.index),
        ),
        dividerHeight: 0.0,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white54,
        tabs: const <Widget>[
          Tab(text: 'Calculator'),
          Tab(text: 'Converter'),
        ],
      ),
    );
  }
}

/// This function returns a BorderRadius object based on the index of the tab
/// The index is used to determine which side of the tab should have rounded corners
/// The first tab has rounded corners on the left side
/// The second tab has rounded corners on the right side
BorderRadius myBorderRadius(index) {
  if (index == 0) {
    return const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4));
  }
  return const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4));
}


