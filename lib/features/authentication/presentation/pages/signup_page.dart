import 'package:assignment9/core/analytics_engine.dart';
import 'package:assignment9/core/dependency_injection/di_container.dart';
import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/theme/app_pallete.dart';
import 'package:assignment9/core/theme/fonts.dart';
import 'package:assignment9/features/authentication/data/models/user_model.dart';
import 'package:assignment9/features/authentication/domain/usecases/sign_up_user.dart';
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
  late String password, username, givenName, email;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
      body: Stack(children: [
        Form(
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
                  controller: nameController,
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
                  controller: emailController,
                  key: const ValueKey('familyName'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Family Name cannot be empty!';
                    } else if (!value.contains("@")) {
                      return "Invalid email";
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
                  controller: usernameController,
                  key: const ValueKey('username'),
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
                  controller: passwordController,
                  key: const ValueKey('password'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password cannot be empty!';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: translation(context).enterPassword,
                    hintStyle: hintTextStyle,
                    border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: AppPallete.borderColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                const Expanded(
                  flex: 4,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Center(
            child: FilledButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  UserModel user = UserModel(
                      name: nameController.text,
                      password: passwordController.text,
                      email: emailController.text);
                  String response = await locator<SignUpUser>().call(user);
                  AnalyticsEngine.userSignsUp("email");
                  if (response == "Success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response),
                      ),
                    );
                    context.router.maybePop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response),
                      ),
                    );
                  }
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
        ),
      ]),
    );
  }
}
