import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:skill_assessment_task/providers/auth_provider.dart';
import 'package:skill_assessment_task/utils/localization.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../utils/app_theme.dart';
import '../widgets/count_down_widget.dart';
import '../widgets/custom_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  Timer? timer;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var authProvider = context.read<AuthProvider>();
    // authProvider.verifyPhoneNumber(widget.phoneNumber, context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authProvider.addListener(() {
        if(!authProvider.isLoading && authProvider.isCodeSend){
          startResendTimer();
        }
      });
    });
    authProvider.onOtpFetch = (code){
      setState(() {
        textEditingController.text = code;
      });
    };
    super.initState();
  }

  void startResendTimer() {
   if(context.mounted){
     setState(() {
       timer = Timer(const Duration(minutes: 1), onResendTimeout);
     });
   }
  }

  void onResendTimeout() {
    if (context.mounted) {
      setState(() {
        timer = null;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    if(timer != null){
      timer!.cancel();
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Wrap(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/Group 63.png",
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Spacings.xxlarge,
                      bottom: Spacings.normal,
                      left: Spacings.normal,
                      right: Spacings.normal),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stringsOf(context)!.we_Text_you,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: Spacings.xxxsmall,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            text: stringsOf(context)!.enter_code,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextSpan(
                            text: " ${widget.phoneNumber}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ])),
                        SizedBox(
                          height: Spacings.normal,
                        ),
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: authProvider.isTimerStarted? Countdown(
                              seconds: 60,
                              build: (BuildContext context, double time) {
                                return CountDownWidget(time: time,);
                              },
                              interval: const Duration(milliseconds: 100),
                              onFinished: () {
                                authProvider.resetTimer();
                               authProvider.resetToken();
                              },
                            ) : CountDownWidget(time: 0.0),
                          ),
                        ),
                        SizedBox(
                          height: Spacings.normal,
                        ),
                        PinCodeTextField(
                          controller: textEditingController,
                          appContext: context,
                          length: 6,
                          obscureText: true,
                          obscuringCharacter: '*',
                          onChanged: (String value) {},
                          autoFocus: true,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            inactiveFillColor: Theme.of(context).colorScheme.background,
                            activeColor: const Color(0xffEEEEF4),
                            selectedColor: const Color(0xffEEEEF4),
                            selectedFillColor: Theme.of(context).colorScheme.onPrimary,
                            inactiveColor: const Color(0xffEEEEF4),
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(10),
                            disabledColor: const Color(0xffEEEEF4),
                            fieldHeight: 56,
                            fieldWidth: 45,
                            activeFillColor: Theme.of(context).colorScheme.onPrimary,

                          ),
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                        SizedBox(
                          height: Spacings.normal,
                        ),
                        CustomButton(
                          onTap: () async{
                            await authProvider.signInOrSinUp(textEditingController.text, context);
                          },
                          height: 50.0,
                          width: double.infinity,
                          child: authProvider.isSignInLoading? const Center(child: SizedBox(height: 36.0, width: 36.0,child: CircularProgressIndicator())) : Center(
                            child: Text(
                              stringsOf(context)!.continue_button.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Spacings.normal),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                stringsOf(context)!.did_not_receive_code,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              InkWell(
                                onTap: (){
                                  authProvider.onResendCode(widget.phoneNumber, context);
                                },
                                child: Offstage(
                                  offstage: authProvider.isTimerStarted,
                                  child: Text(
                                    stringsOf(context)!.resent_button,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: const Color(0xff4D65C0),
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}


