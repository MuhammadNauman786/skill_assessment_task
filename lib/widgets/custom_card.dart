import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard(
      {Key? key,
        this.child,
        required this.backgroundColor,
        this.width,
        this.onTap,
        this.height})
      : super(key: key);

  Widget? child;
  double? height;
  double? width;
  Color backgroundColor;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}