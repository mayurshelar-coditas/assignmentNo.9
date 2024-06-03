import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/theme/app_pallete.dart';
import 'package:assignment9/core/list_of_items.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key})
      : books = const [
          'Book one',
          'Book two',
          'Book three',
          'Book four',
        ],
        authors = const [
          'Author one',
          'Author two',
          'Author three',
          'Author four',
        ];

  final List<String> books;

  final List<String> authors;

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
            translation(context).home,
            style: GoogleFonts.heebo(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Text(
              translation(context).books,
              style: GoogleFonts.heebo(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          ListOfItems(fetchName: "Books", name: translation(context).books),
          const SizedBox(
            height: 38,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            child: Text(
              translation(context).authors,
              style: GoogleFonts.heebo(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          ListOfItems(fetchName: "Authors", name: translation(context).authors),
        ],
      ),
    );
  }
}
