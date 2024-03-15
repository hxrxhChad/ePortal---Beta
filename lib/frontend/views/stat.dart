import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/index.dart';

class StatView extends StatelessWidget {
  const StatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: StatNavBar(
                onOverViewPressed: () {},
                onHistoryPressed: () {},
                onResultsPressed: () {},
                onSettingsPressed: () {},
                onSearchPressed: () {},
                onNotificationPressed: () {},
                onInfoPressed: () {},
                onProfilePressed: () {},
                navSelected: 'overview',
              ),
            ),
            const VGap(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Welcome to your exam portal, We recommend attempting more and more exams will boost your skills and confidence',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const VGap(height: 30),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const HGap(width: 50),
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return StatAppearedTile(
                            percentage: '56%',
                            description: 'Above 66% participants',
                            title: 'Motion and Laws',
                            icon: Iconsax.glass,
                            color: index % 2 == 0
                                ? Colors.greenAccent
                                : index % 3 == 0
                                    ? const Color.fromARGB(255, 100, 185, 255)
                                    : Colors.orangeAccent,
                          );
                        }),
                  ],
                ),
              ),
            ),
            const VGap(height: 30),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const HGap(width: 50),
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    const HGap(width: 13),
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return StatAppearedTile(
                            percentage: '56%',
                            description: 'Above 66% participants',
                            title: 'Motion and Laws',
                            icon: Iconsax.glass,
                            color: index % 2 == 0
                                ? Colors.greenAccent
                                : index % 3 == 0
                                    ? const Color.fromARGB(255, 100, 185, 255)
                                    : Colors.orangeAccent,
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
