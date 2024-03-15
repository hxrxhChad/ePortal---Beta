import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../backend/state management/index.dart';
import 'index.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String) onChanged;
  final void Function() onTap;
  final String initialValue;
  final bool eye;
  const AuthField(
      {super.key,
      required this.keyboardType,
      required this.obscureText,
      required this.onChanged,
      required this.initialValue,
      required this.eye,
      required this.onTap,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EyeCubit, bool>(
      builder: (context, state) {
        return TextFormField(
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          onChanged: onChanged,
          cursorHeight: 15,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: keyboardType,
          autocorrect: false,
          obscureText: state,
          cursorColor: Theme.of(context).disabledColor,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Theme.of(context).iconTheme.color!.withOpacity(.5)),
              contentPadding: const EdgeInsets.only(
                  left: 10, top: 12, right: 10, bottom: 12),
              suffixIcon: GestureDetector(
                onTap: () => context.read<EyeCubit>().setEye(!state),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    eye
                        ? state
                            ? Iconsax.eye
                            : Iconsax.eye_slash
                        : null,
                    size: 18,
                    color: Theme.of(context).iconTheme.color!.withOpacity(.5),
                  ),
                ),
              ),
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 40),
              fillColor: Theme.of(context).iconTheme.color!.withOpacity(.04),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide:
                      // BorderSide(color: Theme.of(context).iconTheme.color!),
                      BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).iconTheme.color!.withOpacity(.1)),
              ),
              filled: true),
        );
      },
    );
  }
}

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.black12.withOpacity(.2),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}

class RegisterAddImage extends StatelessWidget {
  final String image;
  final void Function() onTap;
  const RegisterAddImage({
    super.key,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: image == '' || image.isEmpty
          ? Stack(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Icon(
                      Iconsax.image,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(3),
                    child: const Icon(
                      Iconsax.add,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                )
              ],
            )
          : Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 75,
                    width: 75,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: image,
                      placeholder: (context, url) => Load(onTap: () {}),
                      errorWidget: (context, url, error) => const Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(
                          Iconsax.information,
                          color: Colors.blue,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    padding: const EdgeInsets.all(3),
                    child: const Icon(
                      Iconsax.add,
                      color: Colors.blue,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final bool outlined;
  const AuthButton(
      {super.key,
      required this.label,
      required this.onTap,
      required this.outlined});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 300,
        decoration: BoxDecoration(
            color:
                outlined ? Colors.transparent : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
                color: outlined
                    ? Theme.of(context).iconTheme.color!.withOpacity(.1)
                    : Colors.transparent)),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: outlined
                    ? Theme.of(context).iconTheme.color
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}

class AuthButtonSmall extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final bool outlined;
  const AuthButtonSmall({
    super.key,
    required this.label,
    required this.onTap,
    required this.outlined,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            color:
                outlined ? Colors.transparent : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
                color: outlined
                    ? Theme.of(context).iconTheme.color!.withOpacity(.1)
                    : Colors.transparent)),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11,
                color: outlined
                    ? Theme.of(context).iconTheme.color
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}

class RegisterDropDown extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  const RegisterDropDown({
    super.key,
    required this.options,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).iconTheme.color!.withOpacity(.04),
          borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(3),
        underline: const SizedBox.shrink(),
        style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).iconTheme.color!.withOpacity(.5)),
        icon: const SizedBox.shrink(),
        hint: const SizedBox.shrink(),
        padding: EdgeInsets.zero,
        value: selectedValue, // Selected option
        onChanged: (String? newValue) =>
            context.read<AuthCubit>().setAdmin(newValue!),
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            onTap: () {},
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).iconTheme.color!.withOpacity(.5)),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class PaddedBox extends StatelessWidget {
  final String label;
  const PaddedBox({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).iconTheme.color!.withOpacity(.8),
          borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Text(
        label,
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white),
      ),
    );
  }
}
