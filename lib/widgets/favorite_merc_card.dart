import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import 'custom_card.dart';

class FavoriteMerchCard extends StatelessWidget {
  FavoriteMerchCard(
      {Key? key,
        required this.imagePath,
        required this.title,
        required this.subTitle,
        this.discount})
      : super(key: key);
  final String imagePath;
  final String title;
  final String subTitle;
  String? discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          backgroundColor: Colors.white,
          height: 134.0,
          width: 263.0,
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              discount != null? Positioned(
                  left: 0.0,
                  top: Spacings.xsmall,
                  child: Container(
                      color: const Color(0xff2CA66F),
                      child: Padding(
                        padding: EdgeInsets.all(Spacings.xxsmall),
                        child: Text(
                          discount!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                              color: white, fontWeight: FontWeight.bold),
                        ),
                      ))) : Container(),
              Positioned(
                  right: 5.0,
                  top: Spacings.xsmall,
                  child: CircleAvatar(
                    backgroundColor: white,
                    radius: Spacings.small,
                    child: Image.asset("assets/images/heart-Filled.png"),
                  )),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 90.0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xff0F1527).withOpacity(0.0),
                            const Color(0xff0F1527).withOpacity(0.6)
                          ],
                        )),
                  )),
            ],
          ),
        ),
        SizedBox(
          width: 263.0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: darkBlue, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/star-Filled.png"),
                      SizedBox(
                        width: Spacings.xsmall,
                      ),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '4.0',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                  color: darkBlue, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '(100+)',
                              style: Theme.of(context).textTheme.bodySmall!,
                            ),
                          ])),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(subTitle, style: Theme.of(context).textTheme.bodySmall!)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
