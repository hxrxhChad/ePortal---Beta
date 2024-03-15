import 'dart:async';

import 'package:flutter/material.dart';

class VGap extends StatelessWidget {
  final double height;
  const VGap({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HGap extends StatelessWidget {
  final double width;
  const HGap({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

class Load extends StatefulWidget {
  final void Function() onTap;
  const Load({super.key, required this.onTap});

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer to stop loading after 30 seconds
    _timer = Timer(const Duration(seconds: 5), () {
      // Stop loading after 30 seconds
      // Navigator.pop(context);
      widget.onTap;
    });

    // widget.onTap;
  }

  @override
  void dispose() {
    // Dispose the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

// if loader is loading till 30 seconds then stop loading and listen to onTap function

void showSnackbar(BuildContext context, String content, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 1),
    ),
  );
}
