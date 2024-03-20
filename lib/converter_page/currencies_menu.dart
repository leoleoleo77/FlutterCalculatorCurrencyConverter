import 'package:bestest_calculator/eye_candy/ui_constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CurrenciesMenu extends StatelessWidget {
  final String value;
  final Map currencies;
  final void Function(String?) onChanged;
  const CurrenciesMenu({
    super.key,
    required this.value,
    required this.currencies,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: DropdownButton2<String>(
        //dropdownColor: MidnightGray,
        //menuMaxHeight: screenHeight(context) * 0.6,
        //padding: const EdgeInsets.only(left: 35),
        //value: value,
        /*icon: const Icon(
            Icons.arrow_drop_down,
            color: BlueWhite,
          ),*/
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 24,
          iconEnabledColor: BlueWhite,
        ),

        dropdownStyleData: DropdownStyleData(
          maxHeight: screenHeight(context) * 0.5,
          width: screenWidth(context) * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: MidnightGray,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thumbColor: MaterialStateProperty.all(BlueWhite),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        isExpanded: true,
        underline: Container(),
        onChanged: onChanged,
        //value: value,
        hint: Align(
          alignment: Alignment.centerRight,
          child: Text(
            value,
            style: const TextStyle(
              color: BlueWhite,
              fontSize: 15,
            ),
          ),
        ),
        style: const TextStyle(
          color: BlueWhite,
          fontSize: 15,
        ),

        /// This line of code is used to generate a list of DropdownMenuItem<String> widgets for a DropdownButton in Flutter. Here's a step-by-step breakdown:
        /// 1. currencies.keys: This retrieves all the keys from the currencies map. The keys represent the different currency types.
        /// 2. .toSet(): This converts the keys to a set. A set is a collection of unique items, so this step ensures that there are no duplicate currencies.
        /// 3. .toList(): This converts the set back to a list. This is done because the map function operates on lists.
        /// 4. .map<DropdownMenuItem<String>>((value) {...}): This applies the provided function to each item in the list.
        ///    The function takes a currency (represented by value) and returns a DropdownMenuItem<String> widget.
        /// 5. DropdownMenuItem<String>(...): This creates a new DropdownMenuItem widget.
        ///    The value property is set to the current currency, and the child property is set to a Text widget displaying the currency.
        /// 6. .toList(): Finally, this converts the iterable returned by map back into a list.
        ///     This is necessary because the items property of DropdownButton expects a list.
        /// So, in summary, this line of code generates a list of dropdown menu items, one for each unique currency in the currencies map.
        items: currencies.keys.toSet().toList().map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text('$value - ${currencies[value]}',
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }
}
