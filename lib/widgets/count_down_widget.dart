import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CountDownWidget extends StatelessWidget {
  CountDownWidget({Key? key, required this.time}) : super(key: key);

  double time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: timerBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              "0${time.toInt() ~/ 60}",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall,
            ),
          ),
        ),
        Text(
          " : ",
          style:
          Theme.of(context).textTheme.bodySmall,
        ),
        Container(
          decoration: timerBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              (time.toInt() % 60)
                  .toString()
                  .padLeft(2, '0'),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall,
            ),
          ),
        )
      ],
    );
  }
}