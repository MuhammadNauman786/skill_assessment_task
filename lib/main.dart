import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_assessment_task/providers/locale_provider.dart';
import 'package:skill_assessment_task/utils/constants.dart';
import 'package:skill_assessment_task/utils/preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences.initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
      ),
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.git
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Skill Assessment Task',
          home: Container(),
          localizationsDelegates: localizationsDelegates,
          supportedLocales: localesList,
          locale: Locale(value.locale.name.toLowerCase()),
        );
      }
    );
  }
}
