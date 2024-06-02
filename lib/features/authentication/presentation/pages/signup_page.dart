import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/theme/app_pallete.dart';
import 'package:assignment9/core/theme/fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  TextStyle heebo = Fonts.heebo(14, FontWeight.w500);
  TextStyle hintTextStyle =
      Fonts.heeboWithColor(14, FontWeight.w500, AppPallete.hintTextColor);
  late String password, username, givenName, familyName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              translation(context).register,
              style: Fonts.heebo(16, FontWeight.w500),
            ),
          ],
        ),
        shadowColor: const Color(0xFF101828).withOpacity(0.05),
        backgroundColor: AppPallete.whiteColor,
      ),
      backgroundColor: AppPallete.whiteColor,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Text(
translation(context).givenName,
                style: heebo,
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                key: const ValueKey('givenName'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be empty!';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText: translation(context).enterGivenName,
                  hintStyle: hintTextStyle,
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppPallete.borderColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onSaved: (value) {
                  givenName = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                translation(context).familyName,
                style: heebo,
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                key: const ValueKey('familyName'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Family Name cannot be empty!';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText: translation(context).enterFamilyName,
                  hintStyle: hintTextStyle,
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppPallete.borderColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onSaved: (value) {
                  familyName = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                translation(context).userName,
                style: heebo,
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                key: const ValueKey('username'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username cannot be empty!';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText: translation(context).enterUserName,
                  hintStyle: hintTextStyle,
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppPallete.borderColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onSaved: (value) {
                  username = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                translation(context).password,
                style: heebo,
              ),
              const SizedBox(
                height: 4,
              ),
              TextFormField(
                key: const ValueKey('password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty!';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  hintText:translation(context).enterPassword,
                  hintStyle: hintTextStyle,
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppPallete.borderColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 36,
              ),
              Center(
                child: FilledButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppPallete.signinButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Border radius
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Text(
                      translation(context).signup,
                      style: heebo,
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
