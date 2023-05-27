import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_assessment_task/providers/locale_provider.dart';

import '../providers/auth_provider.dart';
import '../utils/app_theme.dart';
import '../utils/constants.dart';
import '../utils/localization.dart';
import '../widgets/custom_button.dart';
import '../widgets/phone_number_text_field.dart';
import 'otp_verification_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  bool validate(){
    var authProvider = context.read<AuthProvider>();
    if(textEditingController.text.isEmpty){
      authProvider.setError(stringsOf(context)!.error_enter_number, context);
      return false;
    }

    if(textEditingController.text.length < 10 || textEditingController.text.length > 10){
      authProvider.setError(stringsOf(context)!.error_invalid_number, context);
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, locale, child) {
        return Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if(locale.locale == LOCALE.en){
                          locale.setLocale(LOCALE.ar);
                        }
                        else{
                          locale.setLocale(LOCALE.en);
                        }
                      },
                      child: Image.asset(
                        "assets/images/flag.png",
                        height: 32.0,
                        width: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Wrap(
                      direction: Axis.horizontal,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/Group 56.png",
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: Spacings.xxlarge, bottom: Spacings.normal, left: Spacings.normal, right: Spacings.normal),
                        child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  stringsOf(context)!.welcome,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(height: Spacings.xxxsmall,),
                                RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: stringsOf(context)!.enter_phoneNumber, style: Theme.of(context).textTheme.bodyMedium,),
                                    TextSpan(text: " Find", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                                  ]
                                )),
                                SizedBox(height: Spacings.large,),
                                Padding(
                                  padding: EdgeInsets.only(bottom: Spacings.xxsmall),
                                  child: Text(stringsOf(context)!.phone, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff000000,), fontWeight: FontWeight.bold),),
                                ),
                                PhoneNumberTextField(phoneNumberController: textEditingController,),
                                SizedBox(height: Spacings.large,),
                                CustomButton(
                                  onTap: (){
                                    if (validate()) {
                                      if(!authProvider.isLoading){
                                        authProvider.verifyPhoneNumber("${authProvider.countryCode}${textEditingController.text}", context);
                                      }
                                      else{
                                        // Fluttertoast.showToast(
                                        //     msg: 'Sending messages..',
                                        //     toastLength: Toast.LENGTH_SHORT,
                                        //     gravity: ToastGravity.BOTTOM,
                                        //     timeInSecForIosWeb: 1,
                                        //     backgroundColor: Colors.white10,
                                        //     textColor: Colors.white,
                                        //     fontSize: 16.0);
                                      }
                                    }
                                  },
                                  height: 50.0,
                                  width: double.infinity,
                                  child: authProvider.isLoading? const Center(child: SizedBox(height: 36.0, width: 36.0,child: CircularProgressIndicator())) : Center(
                                    child: Text(stringsOf(context)!.continue_button.toUpperCase(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: Colors.white
                                    ),),
                                  ),
                                ),

                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        );
      }
    );
  }
}


