import 'package:flutter/material.dart';

class CoolTabBar extends StatefulWidget {
  const CoolTabBar({super.key, required this.tabController});
  final TabController tabController;
  @override
  CoolTabBarState createState() => CoolTabBarState();
}

class CoolTabBarState extends State<CoolTabBar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.95,
      height: screenHeight * 0.05,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(45, 52, 64, 1.0),
        borderRadius: BorderRadius.circular(4.0), // This rounds the edges

      ),
      child: TabBar(
        controller: widget.tabController,
        splashFactory: NoSplash.splashFactory,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: const Color.fromRGBO(0, 96, 229, 1.0),

          borderRadius: myBorderRadius(widget.tabController.index),
        ),
        dividerHeight: 0.0,
        //indicatorWeight: 1.0,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white54,

        tabs: const <Widget>[
          Tab(text: 'Calculator'),
          Tab(text: 'Converter'),
        ],
        onTap: (index) {
          setState(() {});
        },
      ),
    );
  }
}

BorderRadius myBorderRadius(index) {
  if (index == 1) {
    return const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),);
  }
  return const BorderRadius.only(
    topLeft: Radius.circular(4),
    bottomLeft: Radius.circular(4),
  );
}


