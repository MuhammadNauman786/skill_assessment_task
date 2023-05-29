import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.name, required this.image})
      : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(Spacings.xxsmall),
          child: Container(
            decoration: cardDecoration,
            child: Padding(
              padding: EdgeInsets.all(Spacings.xsmall),
              child: Image.asset(image, width: 82.0, height: 62.0,),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: Spacings.xsmall),
          child: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: darkBlue, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
