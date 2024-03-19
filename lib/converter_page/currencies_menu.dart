import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:flutter/material.dart';

class CurrenciesMenu extends StatefulWidget {
  const CurrenciesMenu({Key? key}) : super(key: key);

  @override
  _CurrenciesMenuState createState() => _CurrenciesMenuState();
}

class _CurrenciesMenuState extends State<CurrenciesMenu> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(15),
        dropdownColor: MidnightGray,
        menuMaxHeight: 500.0,
        padding: const EdgeInsets.only(left: 35),
        value: 'value',
        icon: const Icon(
            Icons.arrow_drop_down,
            color: BlueWhite,
          ),
        isExpanded: true,
        underline: Container(),
        onChanged: (String? newValue) {},
        style: const TextStyle(
          color: BlueWhite,
          fontSize: 15,
        ),
        items: const <DropdownMenuItem<String>>[
          DropdownMenuItem<String>(
            value: 'value',
            child: Text('USD',
              overflow: TextOverflow.ellipsis,),
            ),
          ],
        ),
    );
  }
}
