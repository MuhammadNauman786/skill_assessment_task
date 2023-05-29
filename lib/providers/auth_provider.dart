import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skill_assessment_task/utils/localization.dart';

import '../screens/home_screen.dart';
import '../screens/otp_verification_screen.dart';

typedef OtpCodeFetchCallBack = void Function(PhoneAuthCredential credential);

class AuthProvider with ChangeNotifier{
  String countryCode = '+93';
  bool isTimerStarted = false;
  bool isLoading = false;
  bool isCodeSend = false;
  bool isCodeReceived = false;
  bool isSignInLoading = false;
  int? resendToken;
  String? verificationId;
  String? errorMessage;
  String? code;
  OtpCodeFetchCallBack? onOtpFetch;
  final auth = FirebaseAuth.instance;

  dynamic setCountryCode(String value){
    countryCode = value;
  }

  dynamic resetTimer(){
    isTimerStarted = false;
    notifyListeners();
  }

  dynamic resetToken(){
    resendToken = null;
    notifyListeners();
  }

  dynamic verifyPhoneNumber(String phoneNumber, BuildContext context) async {
    // startResendTimer();

      isLoading = true;
      notifyListeners();

    await auth.verifyPhoneNumber(
      timeout: const Duration(minutes: 1),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
          code = credential.smsCode.toString();
          onOtpFetch?.call(credential);
          isCodeReceived = true;
          notifyListeners();
      },
      verificationFailed: (FirebaseAuthException exception) async {
          isLoading = false;
          setError(exception.message.toString(), context);
          notifyListeners();
      },
      codeSent: (String verificationId, int? resendToken) async{
          isTimerStarted = true;
          isCodeSend = true;
          isLoading = false;
          this.resendToken = resendToken;
          this.verificationId = verificationId;
          Future.delayed(const Duration(seconds: 1));
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => OtpVerificationScreen(phoneNumber: phoneNumber, code: code,)));
          notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
          resetToken();
          setError(stringsOf(context)!.otp_expire, context);
          this.verificationId = verificationId;
          notifyListeners();
      },
      forceResendingToken: resendToken,
    );
  }

  dynamic signInOrSinUp(String text, BuildContext context) async{
    isSignInLoading = true;
    notifyListeners();

    if(text.isNotEmpty && verificationId != null){
      try{

        await auth.signInWithCredential( PhoneAuthProvider.credential(
            verificationId:
            verificationId!,
            smsCode: text));
        isSignInLoading = false;
        notifyListeners();
        if(context.mounted){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
        }

      } on FirebaseAuthException catch (e) {
        // TODO
        if(e.code == "invalid-verification-code"){
            isSignInLoading = false;
            notifyListeners();
            setError(stringsOf(context)!.invalid_otp, context);
        }
        else{
            isSignInLoading = false;
            notifyListeners();
            setError(e.message.toString(), context);
        }
      }
    }
    else{
      setError(stringsOf(context)!.error_enter_code, context);
    }
    
    isSignInLoading = true;
    notifyListeners();
  }

  dynamic setError(String text, BuildContext context){
    final snackBar = SnackBar(content: Text(text.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red,),), backgroundColor: const Color(0xffEEEEF4),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  dynamic onResendCode(String phoneNumber, BuildContext context){
    verifyPhoneNumber(phoneNumber, context);
  }

  dynamic showToast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff07052A),
        textColor: Colors.white,
        fontSize: 16.0);
  }

}