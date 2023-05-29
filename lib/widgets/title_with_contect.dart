import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/locale_provider.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';

class TitleWithContent extends StatelessWidget {
  TitleWithContent({Key? key, this.title, this.content, required this.child})
      : super(key: key);

  String? title;
  String? content;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
        builder: (context, localProvider, child1) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(Spacings.xsmall),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      content!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: localProvider.locale.name == LOCALE.ar.name? 9.0 : 12.0),
                    ),
                  ],
                ),
              ),
              child
            ],
          );
        }
    );
  }
}