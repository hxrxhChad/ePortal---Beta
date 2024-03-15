import 'package:exam/frontend/widgets/auth.dart';
import 'package:exam/frontend/widgets/global.dart';
import 'package:flutter/material.dart';

import '../../utils/index.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../backend/state management/index.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

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
                      onPressed: () {},
                      child: const Text(
                        'Profile',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: AuthButton(
                      label: 'Create Test',
                      onTap: () async {
                        Navigator.pushNamed(context, Routes.addTest);
                        // await context.read<AuthCubit>().signOut();
                        // Navigator.pushReplacementNamed(context, '/');
                      },
                      outlined: false),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
