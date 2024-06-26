import 'package:assignment9/core/analytics_engine.dart';
import 'package:assignment9/core/dependency_injection/di_container.dart';
import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/routes/app_router.gr.dart';
import 'package:assignment9/core/theme/app_pallete.dart';
import 'package:assignment9/core/theme/fonts.dart';
import 'package:assignment9/features/authentication/data/models/user_model.dart';
import 'package:assignment9/features/authentication/domain/usecases/sign_in_user.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  TextStyle heebo = Fonts.heebo(14, FontWeight.w500);
  TextStyle hintTextStyle =
      Fonts.heeboWithColor(14, FontWeight.w500, AppPallete.hintTextColor);
  late SharedPreferences pref;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/images/log_in.png'),
                ),
              ),
              const SizedBox(height: 16),
              Text(translation(context).userName, style: heebo),
              const SizedBox(height: 4),
              TextFormField(
                controller: emailController,
                key: const ValueKey('username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name cannot be empty!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: translation(context).enterUserName,
                  hintStyle: hintTextStyle,
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppPallete.borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(translation(context).password, style: heebo),
              const SizedBox(height: 4),
              TextFormField(
                controller: passwordController,
                key: const ValueKey('password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cannot be empty!';
                  } else if (value.length < 6) {
                    return 'Password not long enough';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: translation(context).enterPassword,
                  hintStyle: hintTextStyle,
                  border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppPallete.borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: FilledButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      UserModel user = UserModel(
                          name: emailController.text,
                          password: passwordController.text,
                          email: emailController.text);
                      String response = await locator<SignInUser>().call(user);
                      if (response == "Success") {
                        await pref.setBool('isLoggedIn', true);
                        AnalyticsEngine.userLogsIn("email");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(response),
                          ),
                        );
                        context.router.replace(const MainRoute());
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
                        horizontal: 16, vertical: 16),
                    child: Text(
                      translation(context).signIn,
                      style: heebo,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () => context.router.push(const SignUpRoute()),
                  child: Text(
                    textAlign: TextAlign.center,
                    translation(context).dontHaveAnAccountYetSignUp,
                    style: Fonts.heeboWithColor(
                        16, FontWeight.w400, AppPallete.signUpText),
                  ),
                ),
              ),
              const Expanded(flex: 4, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
