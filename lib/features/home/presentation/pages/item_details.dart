import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ItemDetails extends StatelessWidget {
  const ItemDetails(
      {super.key, required this.description, required this.name,});

  final String description, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
