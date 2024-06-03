import 'package:assignment9/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key, required this.name, required this.fetchName});

  final String name, fetchName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(fetchName).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.push(
                            ItemDetails(
                                name: snapshot.data!.docs[index]["name"],
                                description: snapshot.data!.docs[index]
                                    ["description"]),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            snapshot.data!.docs[index]["name"],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                      ),
                    ],
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
