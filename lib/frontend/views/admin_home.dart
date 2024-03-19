// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../backend/state management/index.dart';
import '../../utils/index.dart';
import '../widgets/index.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});
  Routes route = Routes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VGap(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ePortal',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(
                      'Admin Panel',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black54),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'History',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                        )),
                    TextButton(
                      onPressed: () async {
                        await context.read<AuthCubit>().signOut();
                        Navigator.pushNamed(context, Routes.initial);
                      },
                      child: const Text(
                        'Profile',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                            useRootNavigator: true);
                      },
                      child: Container(
                        height: 39,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                                color: Colors.black12.withOpacity(.2))),
                        padding: const EdgeInsets.only(left: 40, right: 45),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.search_normal_1,
                              size: 15,
                            ),
                            HGap(width: 10),
                            Text(
                              'Search',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const HGap(width: 30),
                    SizedBox(
                      width: 150,
                      child: AuthButton(
                          label: 'Create Test',
                          onTap: () async {
                            Navigator.pushNamed(context, Routes.addTest);
                          },
                          outlined: false),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
