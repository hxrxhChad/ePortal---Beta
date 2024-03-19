// ignore_for_file: use_build_context_synchronously

import 'package:exam/frontend/widgets/auth.dart';
import 'package:exam/frontend/widgets/global.dart';
import 'package:exam/utils/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../backend/models/index.dart';
import '../../backend/state management/index.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> items = List.generate(100, (index) => 'Item $index');

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          CupertinoIcons.multiply,
          size: 18,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 18,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    debugPrint('Query in buildResults: $query');
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        List<TestModel> filteredList = [];

        if (query.isNotEmpty) {
          filteredList = state.testModel
              .where((testModel) => testModel.testName!
                  .toLowerCase()
                  .startsWith(query.toLowerCase()))
              .toList();
        }

        return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12.withOpacity(.1),
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Iconsax.glass,
                          size: 18,
                        ),
                      ),
                      const HGap(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filteredList[index].testName!,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const VGap(height: 5),
                          Text(
                            filteredList[index].testDescription!,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 100,
                          child: filteredList[index].testAuthor !=
                                  FirebaseAuth.instance.currentUser?.uid
                              ? const SizedBox.shrink()
                              : AuthButtonSmall(
                                  label: 'Edit', onTap: () {}, outlined: true)),
                      const HGap(width: 20),
                      SizedBox(
                          width: 100,
                          child: filteredList[index].testAuthor !=
                                  FirebaseAuth.instance.currentUser?.uid
                              ? const SizedBox.shrink()
                              : AuthButtonSmall(
                                  label: 'Delete',
                                  onTap: () {},
                                  outlined: true)),
                      const HGap(width: 20),
                      SizedBox(
                          width: 150,
                          child: AuthButtonSmall(
                              label: 'See Details',
                              onTap: () {},
                              outlined: false)),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    debugPrint('Query in buildResults: $query');
    return BlocBuilder<TestCubit, TestState>(
      builder: (context, state) {
        List<TestModel> filteredList = [];

        if (query.isNotEmpty) {
          filteredList = state.testModel
              .where((testModel) => testModel.testName!
                  .toLowerCase()
                  .startsWith(query.toLowerCase()))
              .toList();
        }

        return ListView.builder(
          itemCount: filteredList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12.withOpacity(.1),
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black)),
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Iconsax.glass,
                          size: 18,
                        ),
                      ),
                      const HGap(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filteredList[index].testName!,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          const VGap(height: 5),
                          Text(
                            filteredList[index].testDescription!,
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 100,
                          child: filteredList[index].testAuthor !=
                                  FirebaseAuth.instance.currentUser?.uid
                              ? const SizedBox.shrink()
                              : AuthButtonSmall(
                                  label: 'Edit',
                                  onTap: () {
                                    context
                                        .read<TestCubit>()
                                        .setTestId(filteredList[index].testId!);
                                    Navigator.pushNamed(
                                        context, Routes.addTest);
                                  },
                                  outlined: true)),
                      const HGap(width: 20),
                      SizedBox(
                          width: 100,
                          child: filteredList[index].testAuthor !=
                                  FirebaseAuth.instance.currentUser?.uid
                              ? const SizedBox.shrink()
                              : AuthButtonSmall(
                                  label: 'Delete',
                                  onTap: () {},
                                  outlined: true)),
                      const HGap(width: 20),
                      SizedBox(
                          width: 150,
                          child: AuthButtonSmall(
                              label: 'See Details',
                              onTap: () {},
                              outlined: false)),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search the Test ...';

  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
}
