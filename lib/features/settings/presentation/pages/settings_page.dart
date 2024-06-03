import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/routes/app_router.gr.dart';
import 'package:assignment9/core/theme/app_pallete.dart';
import 'package:assignment9/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _selectedLanguage;

  late SharedPreferences pref;
  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> _loadSelectedLanguage() async {
    String language = await getLanguage();
    setState(() {
      _selectedLanguage = language;
    });
  }

  void changeLanguage(String? value) async {
    if (value == null) return;
    Locale locale = await setLocale(value);
    Main.setLocale(context, locale);

    _selectedLanguage = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.whiteColor,
      appBar: AppBar(
        backgroundColor: AppPallete.whiteColor,
        surfaceTintColor: AppPallete.whiteColor,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            translation(context).settings,
            style: GoogleFonts.heebo(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: _selectedLanguage == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      translation(context).userName,
                      style: GoogleFonts.heebo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      translation(context).language,
                      style: GoogleFonts.heebo(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  RadioListTile<String>(
                    title: Text(translation(context).english),
                    value: 'en',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      changeLanguage(value);
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile<String>(
                    title: Text(translation(context).hindi),
                    value: 'hi',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      changeLanguage(value);
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile<String>(
                    title: Text(translation(context).marathi),
                    value: 'mr',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      changeLanguage(value);
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  RadioListTile<String>(
                    title: Text(translation(context).arabic),
                    value: 'ar',
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      changeLanguage(value);
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: TextButton(
                      onPressed: () async {
                        pref.setBool('isLoggedIn', false);
                        await FirebaseAuth.instance.signOut();
                        context.router.replaceAll(
                          const [
                            LoginRoute(),
                          ],
                        );
                      },
                      child: Text(
                        translation(context).logout,
                        style: GoogleFonts.heebo(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
