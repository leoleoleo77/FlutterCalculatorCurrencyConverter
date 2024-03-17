import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:bestest_calculator/eye_candy/cool_tab_bar.dart';
import 'package:bestest_calculator/calculator_page/calculator_main.dart';
import 'package:bestest_calculator/converter_page/converter_main.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    /// This is an event that fires every time the TabBar index is changed,
    /// regardless of whether it changes by tapping on the TabBar itself or by scrolling on the TabBarView.
    _tabController.addListener(_handleTabIndex);
  }

  /// In this code, the _handleTabIndex method is called every time the TabController index changes.
  /// The indexIsChanging property is checked to ensure that the tab index has fully changed before printing the new index
  ///
  /// We invoke setState to rebuild the widget tree and update the UI.
  /// Specifically, we want to update the appearance of the CoolTabBar
  /// to round the correct corners of the active tab
  void _handleTabIndex() {
    if (!_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  /// _tabController.dispose() is called when the widget is disposed of,
  /// which effectively cleans up the TabController and frees up the memory it was using.
  /// I doubt that this is necessary in this case, but it's a good habit to get into.
  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// SafeArea is a widget that makes sure that the content is not hidden by the status bar or the notch
    return SafeArea(
      child: Column(
        children: <Widget>[

          /// This padding is used to create some space between the top of the screen and the CoolTabBar widget
          Padding(
            /// The space is equal to 1% of the screen height
            padding: EdgeInsets.only(top: screenHeight(context) * 0.01),
            /// CoolTabBar is a Custom Widget that creates a TabBar
            /// See 'lib/eye_candy/cool_tab_bar.dart' for more details
            child: CoolTabBar(
                tabController: _tabController
            ),
          ),

          ///Expanded is used to make the TabBarView widget take up all remaining space in the Column after the CoolTabBar widget.
          ///This means that the TabBarView will expand to fill the space that is left after placing the CoolTabBar widget.
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