import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../backend/state management/index.dart';
import '../../utils/index.dart';
import '../widgets/index.dart';
import 'index.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authId != '' || state.status == Status.success) {
          if (state.admin == 'Admin') {
            Navigator.pushReplacementNamed(context, Routes.adminHome);
          } else if (state.admin == 'Candidate / Student') {
            Navigator.pushReplacementNamed(context, Routes.studentHome);
          }
        }
      },
      builder: (context, state) {
        if (state.status == Status.loading) {
          return Load(onTap: () {});
        }
        return Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SelectableText(
                'ePortal',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              const VGap(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SelectableText(
                        "Let's dive into ePortal",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      const VGap(height: 10),
                      const PaddedBox(label: 'Log in'),
                      const VGap(height: 40),
                      AuthField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        onChanged: (x) =>
                            context.read<AuthCubit>().setEmailId(x),
                        initialValue: context.read<AuthCubit>().emailId,
                        eye: false,
                        onTap: () {},
                        hintText: 'Email Address',
                      ),
                      const VGap(height: 10),
                      AuthField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        onChanged: (x) =>
                            context.read<AuthCubit>().setPassword(x),
                        initialValue: context.read<AuthCubit>().password,
                        eye: true,
                        onTap: () {},
                        hintText: 'Password',
                      ),
                      const VGap(height: 20),
                      AuthButton(
                          label: 'Sign in',
                          onTap: () => context.read<AuthCubit>().login(),
                          outlined: false),
                      const VGap(height: 10),
                      AuthButton(
                          label: 'Register',
                          onTap: () => showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                              builder: (context) => const RegisterView()),
                          outlined: true),
                    ],
                  ),
                  Image.asset(
                    'assets/images/auth.png',
                    height: 300,
                  )
                ],
              ),
            ],
          ),
        ));
      },
    );
  }
}
