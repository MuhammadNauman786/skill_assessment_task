import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:skill_assessment_task/providers/locale_provider.dart';
import '../providers/auth_provider.dart';
import '../utils/localization.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({Key? key, required this.phoneNumberController}) : super(key: key);

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, local, child) {
        return InternationalPhoneNumberInput(
          searchBoxDecoration: InputDecoration(
            labelText: stringsOf(context)!.enter_country_na_0r_co,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              filled: true,
              border: Theme.of(context).inputDecorationTheme.border,
          ),

          textFieldController: phoneNumberController,

          formatInput: false,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          inputDecoration: InputDecoration(
              filled: true,
              border: Theme.of(context).inputDecorationTheme.border
          ),
          textStyle: Theme.of(context).textTheme.bodyMedium,
          selectorTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: const Color(0xff07052A),
          ),
          selectorConfig: const SelectorConfig(
            setSelectorButtonAsPrefixIcon: true,
            showFlags: false,
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,),
          onInputChanged: (PhoneNumber value) {
            context.read<AuthProvider>().setCountryCode(value.dialCode!);
          },

          locale: local.locale.name,
        );
      }
    );
  }
}
