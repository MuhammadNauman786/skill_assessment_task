import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_assessment_task/providers/auth_provider.dart';
import 'package:skill_assessment_task/providers/locale_provider.dart';
import 'package:skill_assessment_task/screens/home_screen.dart';
import 'package:skill_assessment_task/screens/welcome_screen.dart';
import 'package:skill_assessment_task/utils/app_theme.dart';
import 'package:skill_assessment_task/utils/constants.dart';
import 'package:skill_assessment_task/utils/preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Preferences.initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
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
          home: FirebaseAuth.instance.currentUser != null? const HomeScreen() : const WelcomeScreen(),
          localizationsDelegates: localizationsDelegates,
          supportedLocales: localesList,
          locale: Locale(value.locale.name.toLowerCase()),
          theme: appTheme,
        );
      }
    );
  }
}
