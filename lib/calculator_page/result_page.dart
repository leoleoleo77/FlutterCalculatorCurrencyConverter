import 'package:flutter/material.dart';
class ResultPage extends StatefulWidget {
  final String input;
   const ResultPage({
     super.key,
     required this.input,
   });

  @override
  State<ResultPage> createState() {
    return ResultPageState();
  }
}

class ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.green,
              child: Text(widget.input,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              color: Colors.red,
              child: Text(widget.input,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 90,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}


