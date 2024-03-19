// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../backend/state management/index.dart';
import '../../utils/index.dart';
import '../widgets/index.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  Routes route = Routes();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == Status.success) {
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
        return Container(
          height: 500,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VGap(height: 10),
              const BottomSheetDivider(),
              const VGap(height: 40),
              const SelectableText(
                "Register to ePortal",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const VGap(height: 40),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return RegisterDropDown(
                                options: const ['Candidate / Student', 'Admin'],
                                selectedValue: state.admin == ''
                                    ? 'Candidate / Student'
                                    : state.admin);
                          },
                        ),
                        const VGap(height: 10),
                        SizedBox(
                          width: 200,
                          child: AuthField(
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            onChanged: (x) =>
                                context.read<AuthCubit>().setName(x),
                            initialValue: '',
                            eye: false,
                            onTap: () {},
                            hintText: 'Name',
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return RegisterAddImage(
                            onTap: () => context.read<AuthCubit>().addImage(),
                            image: state.photo);
                      },
                    ),
                  ],
                ),
              ),
              const VGap(height: 10),
              AuthField(
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                onChanged: (x) => context.read<AuthCubit>().setEmailId(x),
                initialValue: '',
                eye: false,
                onTap: () {},
                hintText: 'Email Address',
              ),
              const VGap(height: 10),
              AuthField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: false,
                onChanged: (x) => context.read<AuthCubit>().setPassword(x),
                initialValue: '',
                eye: true,
                onTap: () {},
                hintText: 'Password',
              ),
              const VGap(height: 10),
              AuthField(
                keyboardType: TextInputType.text,
                obscureText: false,
                onChanged: (x) =>
                    context.read<AuthCubit>().setOrganizationName(x),
                initialValue: '',
                eye: false,
                onTap: () {},
                hintText: 'Enter organization/institute name',
              ),
              const VGap(height: 40),
              AuthButton(
                  label: 'Sign up',
                  onTap: () async {
                    await context.read<AuthCubit>().register();
                    debugPrint('${state.admin} is the admin value');
                    if (state.status == Status.success) {
                      if (state.admin == 'Admin') {
                        Navigator.pushReplacementNamed(
                            context, Routes.adminHome);
                      } else if (state.admin == 'Candidate / Student') {
                        Navigator.pushReplacementNamed(
                            context, Routes.studentHome);
                      }
                    }
                  },
                  outlined: false),
            ],
          ),
        );
      },
    );
  }
}
