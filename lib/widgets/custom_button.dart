import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_assessment_task/providers/locale_provider.dart';

import '../utils/app_theme.dart';
import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, this.height, this.width, this.onTap, this.child}) : super(key: key);

  double? height;
  double? width;
  Widget? child;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, locale, child1) {
        return GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: boxDecoration,
                child: child,
              ),
              locale.locale == LOCALE.en? const Positioned(top: 0.0,right: 15.0, bottom: 0.0,child: Icon(Icons.arrow_forward, color: Colors.white,),)
                  : const Positioned(top: 0.0,left: 15.0, bottom: 0.0,child: Icon(Icons.arrow_forward, color: Colors.white,),),
            ],
          ),
        );
      }
    );
  }
}