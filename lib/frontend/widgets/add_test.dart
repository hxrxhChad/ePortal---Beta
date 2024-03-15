// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/frontend/widgets/global.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TestField extends StatelessWidget {
  double? maxWidth;
  final String label;
  final String hintText;
  final void Function(String) onChanged;
  final String initialValue;
  final TextEditingController controller;
  TestField({
    super.key,
    this.maxWidth,
    required this.label,
    required this.hintText,
    required this.onChanged,
    required this.initialValue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const VGap(height: 10),
        TextFormField(
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          onChanged: onChanged,
          cursorHeight: 15,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.text,
          autocorrect: false,
          controller: controller,
          cursorColor: Theme.of(context).disabledColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Theme.of(context).iconTheme.color!.withOpacity(.5)),
            contentPadding:
                const EdgeInsets.only(left: 10, top: 12, right: 10, bottom: 10),
            constraints:
                BoxConstraints(maxWidth: maxWidth ?? 300, maxHeight: 40),
            fillColor: Theme.of(context).iconTheme.color!.withOpacity(.04),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).iconTheme.color!.withOpacity(.1)),
            ),
            // BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).iconTheme.color!.withOpacity(.2)),
            ),
            filled: false,
          ),
        ),
      ],
    );
  }
}

class ExpandedTestField extends StatelessWidget {
  double? maxWidth;
  double? maxHeight;
  final String label;
  final String hintText;
  final void Function(String) onChanged;
  final String initialValue;
  final TextEditingController controller;
  ExpandedTestField({
    super.key,
    this.maxWidth,
    this.maxHeight,
    required this.label,
    required this.hintText,
    required this.onChanged,
    required this.initialValue,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const VGap(height: 10),
        TextFormField(
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          onChanged: onChanged,
          cursorHeight: 15,
          textAlignVertical: TextAlignVertical.top,
          keyboardType: TextInputType.text,
          autocorrect: false,
          controller: controller,
          maxLines: null,
          expands: true,
          cursorColor: Theme.of(context).disabledColor,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                color: Theme.of(context).iconTheme.color!.withOpacity(.5)),
            contentPadding:
                const EdgeInsets.only(left: 10, top: 12, right: 10, bottom: 10),
            constraints: BoxConstraints(
                maxWidth: maxWidth ?? 300, maxHeight: maxHeight ?? 120),
            fillColor: Theme.of(context).iconTheme.color!.withOpacity(.04),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).iconTheme.color!.withOpacity(.1)),
            ),
            // BorderSide.none),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).iconTheme.color!.withOpacity(.2)),
            ),
            filled: false,
          ),
        ),
      ],
    );
  }
}

class AddImage extends StatelessWidget {
  final String image;
  final void Function() onTap;
  const AddImage({
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
                  height: 275,
                  width: 275,
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
